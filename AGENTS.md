# AGENTS.md — Programming guide for the GEVA TR20

> This file is written for **LLMs and AI coding agents** (Claude Code, Cursor, Copilot, …) that
> modify or extend the **TR20** firmware. It is equally useful to human developers. If you are
> generating C code for this board, follow these rules.

## What the board is

The **TR20** is a wall-mounted RFID card reader with a 12-key capacitive touch keypad, made by GEVA
Elettronica for hotel and access-control installations. It talks to a supervisor over
**RS485 / Modbus RTU**.

| | |
|---|---|
| MCU | **ATmega328PB** (AVR 8-bit), 32 KB flash, 2 KB RAM, 1 KB EEPROM |
| Clock | 16 MHz crystal, **`CLKPR` = /2 → F_CPU = 8 MHz** (3.3 V: 16 MHz is out of SOA) |
| Keypad | 12 capacitive keys via Microchip **QTouch / PTC** |
| RFID | NXP **MFRC630** over SPI, ISO/IEC 14443-A (MIFARE) |
| Outputs | relays **K1** (lock) and **K2** (light), buzzer, vibration motor, red + green LED rings |
| Inputs | 2 digital inputs + a setup/reset contact |
| Bus | RS485 half duplex on USART0, `TxEn` on `PORTE2` |
| Toolchain | **MPLAB XC8 v3.10** (AVR), MPLAB X v6.30 or the MPLAB VS Code extensions |
| Upload | resident bootloader over RS485 — see [docs/firmware-upload.md](docs/firmware-upload.md) |

Two projects share one `Library/`:

- **`TR20-Modbus/`** — the production firmware (Modbus RTU slave).
- **`TR20-Test/`** — a bench-test firmware with no Modbus; the smallest complete example.

## Golden rules

1. **Read [`Library/TR20_hw.h`](Library/TR20_hw.h) before writing code.** Every pin, macro, note
   constant and function lives there. Never hard-code a pin or a register when a macro exists.
2. **Call `initHw()` once at the start of `main()`**, and set the clock prescaler *before* it:
   ```c
   cli();
   clock_prescale_set(clock_div_2);   // 16 MHz / 2 = 8 MHz, must match F_CPU
   initHw();
   ```
   `initHw()` runs `SYSTEM_Initialize()` (MCC), sets the 1 ms tick (`OCR3A`), opens the MFRC630 and
   configures the RF front end. Do not re-initialise peripherals yourself.
3. **`F_CPU` is 8 MHz.** It is defined in `mcc_generated_files/system/cpu.h`. If you change the
   clock you must revisit `F_CPU`, the `UBRR0` table in `main.c`, `OCR3A` in `TR20_hw.c` and the
   buzzer divider in `play()` — **and** the bootloader's expectations.
4. **The application must fit below 0x3E00** (15872 bytes), where the bootloader lives. **There are
   only ~245 bytes free**: V6 builds to 15 627 bytes of flash and 948 bytes of RAM with the free
   XC8 v3.10. Check the program-memory figure in the build log after every change, and if you add a
   feature, be ready to remove something. Do not weaken the project's optimisation settings (XC8 `pro`,
   `-Os`/`-O3`, `-fno-common`, `--gc-sections`, `-mconst-data-in-progmem`). Note that the MPLAB X
   project uses `-Os` without LTO while the VS Code project requests `-O3` with WPO/LTO — the two
   paths give different code sizes.
5. **Relays, LEDs and the vibration motor are on the MFRC630 GPIO port, not on AVR pins.** See
   "The `out` shadow register" below — getting this wrong is the most common mistake on this board.
6. **Never busy-wait inside an interrupt**, and never block the main loop for long. On the Modbus
   firmware, call `ProcessPetitModbus()` (or `delay_modbus()`) instead of `delay()` wherever you
   must wait.

## The `out` shadow register

The outputs hang off the MFRC630's `PADOUT` register. The firmware keeps a shadow byte `out` and
pushes it to the chip:

```c
#define SetK1   SetBit(out,7); mfrc630_write_reg(MFRC630_REG_PADOUT, out)   // writes immediately
#define SetK1_  SetBit(out,7)                                               // shadow only
#define Act     mfrc630_write_reg(MFRC630_REG_PADOUT, out)                  // flush the shadow
```

- Macros **without** the trailing underscore write the chip straight away — one SPI transaction
  each.
- Macros **with** the trailing underscore change only `out`; call **`Act`** once to flush several
  changes in a single transaction. This is what `main.c` does with its `Change` flag.
- Several of these macros expand to **two statements** separated by `;`. **Always brace them:**
  ```c
  if (x) { SetK1; } else { ResK1; }     // correct
  if (x) SetK1; else ResK1;             // WRONG — only the first statement is conditional
  ```
- The inputs are read the same way: `in = mfrc630_read_reg(MFRC630_REG_PADIN);` before testing
  `ckIn1`, `ckIn2` or `ckRes`. Those macros read the **shadow** `in`, not the chip.

Bit assignment inside `out` / `in`:

| `out` bit | Output | `in` bit | Input |
|-----------|--------|----------|-------|
| 0 | K2 — light relay (active high) | 1 | setup/reset contact (`ckRes`, active low) |
| 4 | red LEDs (active low) | 2 | digital input 1 (`ckIn1`) |
| 5 | green LEDs (active low) | 3 | digital input 2 (`ckIn2`) |
| 6 | vibration motor (active low) | | |
| 7 | K1 — lock relay (active high) | | |

## Hardware-layer API (`Library/TR20_hw.h`)

| Function / macro | Notes |
|------------------|-------|
| `initHw()` | Full board init. Call once. |
| `millis()` | Milliseconds since reset (TC3 ISR, interrupt-safe read). |
| `delay(ms)` | Blocking wait on `millis()`. **Do not use it in the Modbus firmware** — use `delay_modbus()`. |
| `Key(uint8_t *k)` | Returns `true` **once** per touch (edge-detected); `*k` = key index `0…11`. Call it often: it drives `touch_process()`. |
| `rfid()` | Returns `true` **once** per newly presented card; the UID is in the global `uid[]` (up to 10 bytes). Same card re-reported only after 500 ms out of the field. Can block ~10 ms. |
| `rfid_keepalive_callback` | Function pointer called by `rfid()` at its slow points. The Modbus firmware sets it to `ProcessPetitModbus` — **keep doing that** if you touch the RFID path. |
| `play(freq, ms)` | Buzzer tone on TC1. Note constants `DO4`…`SI7` are in the header. Non-blocking: the ISR stops it. |
| `PlayOk()`, `PlayNo()`, `PlayKey()`, `PlayKeyReject()`, `PlayCardIn()`, … | Canned feedback sequences (these **do** block, via `delay()`). |
| `readEEPROM(a)` / `writeEEPROM(a, v)` | Interrupt-safe (the EEPE write window is protected with `cli()`), and `writeEEPROM` skips the write if the value is unchanged. |
| `readEEPROM_block()` / `writeEEPROM_block()` | Multi-byte versions. |
| `SetBit/ResBit/ClearBit/CheckBit(x, bit)` | Bit helpers used throughout. |

EEPROM addresses 1–6 are the configuration block, and 1–4 are shared with the bootloader — see
[docs/configuration.md](docs/configuration.md). **Do not reuse them.**

## Interrupts in use

| Vector | Purpose |
|--------|---------|
| `TIMER3_COMPA_vect` | **1 ms tick**: `mil++`, and `PROJECT_TIMER_UART_CALL` (on the Modbus firmware this increments `PetitModbusTimerValue`). |
| `TIMER1_COMPA_vect` | Buzzer square wave, self-stopping via `BuzzTime`. |
| `USART0_RX_vect` | `ReceiveInterrupt(UDR0)` — PetitModbus RX, including the discard logic for other slaves. |
| `USART0_UDRE_vect` | Sends the next byte from the TX ring buffer. |
| `USART0_TX_vect` | **TXC**: releases `TxEn` once the last byte has physically left the UART. |

`PROJECT_TIMER_UART_CALL` is the hook that lets `TR20_hw.c` be shared: it is defined in the
project's `define.h`, and `TR20_hw.c` calls it from the 1 ms ISR only if defined. A project with no
Modbus (like `TR20-Test`) simply doesn't define it.

## RS485 transmit path — do not simplify it

The TX path in `TR20-Modbus/main.c` exists in that exact shape because simpler versions corrupted
the bus:

- `putch()` buffers into a 100-byte ring, asserts `set_TxEn`, sends the first byte and enables the
  `UDRE` interrupt.
- `USART0_UDRE_vect` feeds the following bytes; when the buffer empties it switches to the `TXC`
  interrupt.
- `USART0_TX_vect` (TXC) is the **only** place that calls `res_TxEn` — the last bit is out by then,
  so no transient truncates the frame.

If you need to print, go through `putch()` / `putchar()`. Do not write `UDR0` directly and never
busy-wait on TXC inside another interrupt.

## Modbus firmware structure (`TR20-Modbus/main.c`)

`define.h` is the single include for the project:

```c
#include "TR20_hw.h"
#include "PetitModbus/PetitModbus.h"
#include "PetitModbus/PetitModbusPort.h"
#include "uart/usart0.h"
#include "system/system.h"
#define PROJECT_TIMER_UART_CALL PetitModbusTimerValue++
```

The register block is addressed **as bytes**:

```c
#define CharCnt ((char*)&PetitRegisters)[0]
((char*)&PetitRegisters)[19]            // command byte
```

Byte index *n* is the low byte of register *n/2* when *n* is even, the high byte when odd (AVR is
little-endian; Modbus puts the high byte first on the wire). **The full map is in
[docs/modbus-register-map.md](docs/modbus-register-map.md) — read it before touching the register
layout, and update it if you change it.**

The main loop is a flat polling loop, in this order:

1. `ProcessPetitModbus()` — **every iteration, first**.
2. green "life" blink (1.5 s on / 30 ms pulse), suppressible from register 10.
3. every 100 ms: read `in`, publish the input bits.
4. keypad: `Key()`, append ASCII to the buffer, 4 s idle timeout clears it.
5. every 100–150 ms (randomised): `rfid()`, publish the flag and the UID.
6. command byte: level bits (K1, K2, green, red) and one-shot bits (buzzer, vibration, OK, error).
7. `if (Change) Act;` — one SPI write for all the shadow changes.

When you add a feature, add it as another non-blocking step in this loop. Keep
`ProcessPetitModbus()` at the top and keep every wait inside `delay_modbus()`.

## Building

- **MPLAB X**: open `TR20-Modbus` (or `TR20-Test`), configuration `default`, Build. The HEX lands in
  `dist/default/production/`.
- **VS Code**: open `TR20-Modbus/TR20-Modbus.code-workspace`; the project is defined by
  `.vscode/TR20-Modbus.mplab.json`, and the extension generates `cmake/` and builds into `_build/`.
  The extensions **do not install XC8** — it must already be on the machine.
- **`make`** works only after MPLAB X has generated `nbproject/Makefile-local-default.mk` (machine
  paths, deliberately not committed).
- Never commit `build/`, `dist/`, `out/`, `_build/`, `cmake/`, `.generated_files/`,
  `Makefile-local-default.mk` or `Makefile-genesis.properties` — they are git-ignored (they hold
  machine-specific paths).
- `mcc_generated_files/` is produced by **MCC** from the `.mc3` file. Hand-edits are possible but
  get lost on regeneration; one is already in place and documented in `main.c` (touch sensitivity in
  `touch.h` for sealed enclosures).

## Things that will bite you

- **Two-statement macros** without braces (see above).
- Calling `delay()` instead of `delay_modbus()` in the Modbus firmware — the master times out.
- Testing `ckIn1` without refreshing `in` first.
- Writing register 0 to clear `CharCnt` and wiping key char 1 with it (same register).
- Adding code without checking the flash figure: the bootloader limit at **0x3E00** is hard.
- Changing the clock without changing the `UBRR0` table, `OCR3A`, `play()` and `F_CPU`.
- Raising the touch sensitivity: the sealed-enclosure settings are listed in the comment block at
  the top of `TR20-Modbus/main.c` and belong in `mcc_generated_files/touch/touch.h`.

## Conventions for this repository

- Source comments are in **Italian**, documentation (`README.md`, `AGENTS.md`, `docs/`) in
  **English**. Keep it that way.
- Keep `Library/` a sibling of the project folders: both projects include `../Library`.
- Do not add files to `Library/` that only one project uses — put them in the project folder.
- If you change the Modbus register layout, the EEPROM map or the setup sequence, update
  `docs/` in the same commit.
