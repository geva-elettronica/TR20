# TR20 — Modbus RTU register map

The TR20 is a **Modbus RTU slave** on the RS485 bus. Everything the supervisor needs is in the
holding registers; the reader holds no access logic of its own.

| | |
|---|---|
| Protocol | Modbus RTU, 8 data bits, no parity, 1 stop bit |
| Supported functions | **03** read holding registers, **06** write single register, **16 (0x10)** write multiple registers |
| Register count | 30 holding registers (`NUMBER_OF_OUTPUT_PETITREGISTERS` in `Library/PetitModbus/PetitModbus.h`) |
| Slave address | 1…255, set from the keypad, stored in EEPROM — see [configuration.md](configuration.md) |
| Baud rate | 2400…250000, set from the keypad |
| Firmware version | `Ver` in `TR20-Modbus/main.c` (currently **6**), also written to EEPROM address 3 |

## How the map is organised

The firmware works on the register block as a **byte array**
(`((char*)&PetitRegisters)[n]`), so each 16-bit register carries **two independent bytes**.
The AVR is little-endian, so:

- an **even** byte index is the **low** byte of the register — the **second** byte on the wire;
- an **odd** byte index is the **high** byte of the register — the **first** byte on the wire.

Register address = byte index / 2.

## Register table

| Reg | High byte (1st on the wire) | Low byte (2nd on the wire) | Access |
|-----|------------------------------|-----------------------------|--------|
| **0** | key char 1 | **`CharCnt`** — number of key characters in the buffer (0…12) | R/W |
| **1** | key char 3 | key char 2 | R |
| **2** | key char 5 | key char 4 | R |
| **3** | key char 7 | key char 6 | R |
| **4** | key char 9 | key char 8 | R |
| **5** | key char 11 | key char 10 | R |
| **6** | **new-card flag** (1 = new UID available) | key char 12 | R/W |
| **7** | `uid[1]` | `uid[0]` | R |
| **8** | `uid[3]` | `uid[2]` | R |
| **9** | **command byte** (see below) | **input status** (see below) | R / **W** |
| **10** | — | **options** (see below) | R/W |
| 11…29 | — | — | free, available for custom use |

## Keypad buffer — registers 0…6

- `CharCnt` (reg 0, low byte) is the number of characters typed so far, maximum **12**.
- The characters are **ASCII**: keys `0`…`9` become `'0'`…`'9'` (0x30…0x39), key 10 becomes
  `'*'` (0x2A, 42) and key 11 becomes `'#'` (0x23, 35).
- Each keypress gives a short beep, a vibration pulse and a green flash.
- The buffer **auto-clears after 4 s** of inactivity (`timeoutKey`), with a 300 ms red flash.
- The supervisor normally **writes 0 into `CharCnt`** once it has consumed the digits. Writing
  register 0 also overwrites key char 1 (same register) — write the whole register with the high
  byte you want to keep, or simply 0.
- The keypad can be **disabled entirely** at configuration time (EEPROM byte 6); then nothing is
  ever written into the buffer.

## Card reading — registers 6…8

- When a **new** card enters the field, the firmware beeps, pulses the vibration motor, sets the
  **new-card flag** (reg 6 high byte) to 1 and loads the first **4 UID bytes** into registers 7–8.
- The same card is reported **only once**: it is reported again only after it has been out of the
  field for more than 500 ms.
- The supervisor **clears the flag** by writing 0 to it after reading the UID.
- Cards are ISO/IEC 14443-A (MIFARE). Only `uid[0…3]` are published; `uid[]` in the firmware holds
  up to 10 bytes if you need the full UID.
- The RFID poll runs every **100–150 ms** (deliberately randomised, so it never locks step with the
  Modbus master).

## Input status — register 9, low byte (read-only)

| Bit | Meaning |
|-----|---------|
| 0 | digital input 1 (`ckIn1`) — typically the door/lock feedback contact |
| 1 | digital input 2 (`ckIn2`) |
| 2 | setup/reset contact (`ckRes`) |
| 3…7 | unused |

Refreshed every 100 ms.

## Command byte — register 9, high byte (write)

| Bit | Command | Behaviour |
|-----|---------|-----------|
| 0 | **K1** — door lock relay | *level*: relay follows the bit |
| 1 | **K2** — room light relay | *level*: relay follows the bit |
| 2 | **buzzer** | *one-shot*: plays a 200 ms tone, then the firmware clears the bit |
| 3 | **vibration** | *one-shot*: 200 ms pulse, then the firmware clears the bit |
| 4 | **green LEDs** | *level*: LEDs follow the bit |
| 5 | **red LEDs** | *level*: LEDs follow the bit |
| 6 | **"access granted" sequence** | *one-shot*: closes K1, green LEDs, vibration and the two-note confirm tone; releases after **4 s** or as soon as input 1 changes state, then clears the bit |
| 7 | **"access denied" sequence** | *one-shot*: red LEDs, vibration and the two-note reject tone (~0.5 s), then clears the bit |

Bits 0, 1, 4 and 5 are **level** commands: the supervisor must clear them to switch the output off.
Bits 2, 3, 6 and 7 are **one-shot**: write 1, and the firmware clears the bit when the sequence is
over — so polling that bit tells you whether the sequence is still running.

> Bit 6 is the normal "open the door" command: it drives the relay, the LEDs, the vibration and the
> sound in one write, and it closes early when the door contact moves.

## Options — register 10, low byte

| Bit | Meaning |
|-----|---------|
| 0 | **1 = disable the green "life" blink** (the 30 ms green pulse every 1.5 s) |
| 1…7 | unused |

## Notes for the master

- The slave answers only to its own address; messages for other slaves are detected **inside the RX
  interrupt** (at byte 3 or byte 7) and discarded immediately, so RFID polling never corrupts the
  bus traffic of other devices.
- Modbus timeout is 25 ms of silence (`PETITMODBUS_TIMEOUTTIMER`), counted by the 1 ms tick.
- `TxEn` is released in the UART **TXC** interrupt, i.e. only after the last bit has physically left
  the UART — do not change this if you touch the transmit path.
- Keep the master's poll interval comfortably above a few tens of milliseconds: `rfid()` can hold
  the main loop for roughly 10 ms, and it calls `ProcessPetitModbus()` as a keep-alive while it
  does.
