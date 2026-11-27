---
name: tr20-firmware
description: Use when writing or modifying C firmware for the GEVA TR20 RFID card reader with capacitive touch keypad (ATmega328PB, RS485 Modbus RTU slave, MFRC630 RFID, QTouch keypad, XC8 / MPLAB X). Covers the shared hardware layer, the MFRC630 output shadow register, the RS485 TxEn transmit path, the PetitModbus register map, EEPROM configuration, the 0x3E00 bootloader flash limit and the build with MPLAB X or the MPLAB VS Code extensions.
---

# GEVA TR20 firmware

You are writing firmware for the **GEVA TR20** — a wall-mounted RFID card reader with a 12-key
capacitive touch keypad, acting as a **Modbus RTU slave** on an RS485 bus. ATmega328PB (AVR 8-bit),
**F_CPU = 8 MHz** (16 MHz crystal, `CLKPR` = /2), built with **MPLAB XC8 v3.10** under MPLAB X
v6.30+ or the MPLAB extensions for VS Code (which do **not** install XC8 — it must be installed
separately).

## Read these first
- [`AGENTS.md`](../../../AGENTS.md) — the full programming guide; this skill is its short form.
- [`Library/TR20_hw.h`](../../../Library/TR20_hw.h) — every pin macro, note constant and function.
  **Read it instead of guessing a name.**
- [`docs/modbus-register-map.md`](../../../docs/modbus-register-map.md) — the register layout.

## Layout
- `TR20-Modbus/` — production firmware (Modbus RTU slave: keypad buffer, card UID, inputs,
  relay/LED/buzzer/vibration commands).
- `TR20-Test/` — bench-test firmware, no Modbus; smallest complete example.
- `Library/` — shared: `TR20_hw.*` (HAL), `Timer.*`, `mfrc630.*` (RFID driver), `PetitModbus/`.
  Both projects include it as `../Library`, so **keep it a sibling** of the project folders.

## Non-negotiable rules

1. **Init in this order**, once, at the top of `main()`:
   ```c
   cli();
   clock_prescale_set(clock_div_2);   // 16 MHz / 2 = 8 MHz, must match F_CPU
   initHw();                          // MCC peripherals + 1 ms tick + MFRC630 + touch
   ```
   Do not re-initialise peripherals yourself.

2. **Relays, LEDs and the vibration motor live on the MFRC630 GPIO port, not on AVR pins.** The HAL
   keeps a shadow byte `out`:
   - `SetK1`, `ResGreenLed`, … write the chip immediately;
   - `SetK1_`, `ResGreenLed_`, … change only the shadow — then one **`Act`** flushes them all;
   - read inputs with `in = mfrc630_read_reg(MFRC630_REG_PADIN);` **before** testing `ckIn1`,
     `ckIn2`, `ckRes` (those macros read the shadow).

   | `out` | output | `in` | input |
   |---|---|---|---|
   | 0 | K2 light relay (active high) | 1 | setup contact `ckRes` (active low) |
   | 4 | red LEDs (active low) | 2 | input 1 `ckIn1` |
   | 5 | green LEDs (active low) | 3 | input 2 `ckIn2` |
   | 6 | vibration (active low) | | |
   | 7 | K1 lock relay (active high) | | |

3. **Those macros expand to two statements — always brace them:**
   ```c
   if (x) { SetK1; } else { ResK1; }   // correct
   if (x) SetK1; else ResK1;           // WRONG
   ```

4. **Never block.** In `TR20-Modbus` use `delay_modbus(ms)` (which keeps calling
   `ProcessPetitModbus()`), never `delay()`, and call `ProcessPetitModbus()` first in every loop
   iteration. Never busy-wait inside an ISR.

5. **Do not touch the RS485 transmit path** in `main.c`: `putch()` buffers and asserts `set_TxEn`,
   `USART0_UDRE_vect` feeds the following bytes, and `USART0_TX_vect` (TXC) is the **only** place
   that calls `res_TxEn`. Simpler versions corrupt the bus.

6. **The application must stay below 0x3E00** (15872 bytes) — the resident bootloader lives there,
   and **only ~245 bytes are free** (V6 = 15 627 bytes flash, 948 bytes RAM with free XC8 v3.10).
   Check the program-memory figure after every change and keep the project's optimisation settings.

## HAL essentials
`millis()`, `delay(ms)`, `Key(&k)` (true once per touch, `k` = 0…11), `rfid()` (true once per new
card, UID in the global `uid[]`, can block ~10 ms), `play(freq, ms)` with note constants
`DO4…SI7`, `readEEPROM`/`writeEEPROM` (+`_block`, interrupt-safe), `set_TxEn`/`res_TxEn`.
`rfid_keepalive_callback` is set to `ProcessPetitModbus` in the Modbus firmware — keep it.

## Modbus registers (byte-addressed)
The firmware addresses the 30 holding registers as a byte array,
`((char*)&PetitRegisters)[n]`: byte *n* is the **low** byte of register *n/2* when *n* is even, the
**high** byte when odd. Byte 0 = `CharCnt`, 1–12 = ASCII keys, 13 = new-card flag, 14–17 = UID,
18 = input bits, 19 = command bits (0 K1, 1 K2, 2 buzzer, 3 vibration, 4 green, 5 red, 6 "OK"
sequence, 7 "error" sequence; bits 2,3,6,7 are one-shot and self-clearing), 20 = options.
Full detail — and the file to update if you change the layout — is
[`docs/modbus-register-map.md`](../../../docs/modbus-register-map.md).

## Configuration
Modbus address, baud index and keypad-enable live in **EEPROM bytes 1–6** and are entered **on the
keypad** at power-up with the setup contact closed (5 keypresses). Bytes 1–4 are shared with the
bootloader — never repurpose them. See
[`docs/configuration.md`](../../../docs/configuration.md).

## Build and flash
- MPLAB X: open `TR20-Modbus`, configuration `default`, Build → `dist/default/production/*.hex`.
- VS Code: open `TR20-Modbus/TR20-Modbus.code-workspace`; project file
  `.vscode/TR20-Modbus.mplab.json`; builds into `_build/`.
- `make` only works after MPLAB X has generated `nbproject/Makefile-local-default.mk`.
- Upload over RS485 with a USB→RS485 adapter and `Bootloader_v5.exe` from
  <https://download.gevaelettronica.it/Hotel/> — see
  [`docs/firmware-upload.md`](../../../docs/firmware-upload.md).

## Conventions
Source comments Italian, documentation English. Never commit `build/`, `dist/`, `out/`, `_build/`,
`cmake/`, `.generated_files/` or `Makefile-local-default.mk`. If you change the register layout, the
EEPROM map or the setup sequence, update `docs/` in the same commit.
