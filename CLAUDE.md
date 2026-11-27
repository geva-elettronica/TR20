# CLAUDE.md

Guidance for Claude Code and other AI coding agents working in this repository.

**Read [AGENTS.md](AGENTS.md) first** — it is the full programming guide for the TR20 firmware
(hardware layer, the `out` shadow register, the RS485 transmit path, the Modbus main loop, the
build, and the mistakes that bite on this board).

Quick orientation:

| | |
|---|---|
| Board | GEVA **TR20** — RFID + 12-key capacitive keypad reader, RS485 / Modbus RTU |
| MCU | ATmega328PB, `F_CPU` = **8 MHz** (16 MHz crystal, `CLKPR` = /2) |
| Build | MPLAB X v6.30+ **or** MPLAB extensions for VS Code, with **XC8 v3.10** (installed separately) |
| Production firmware | [`TR20-Modbus/`](TR20-Modbus/) |
| Bench-test firmware | [`TR20-Test/`](TR20-Test/) |
| Shared code | [`Library/`](Library/) — must stay a sibling of the project folders (`../Library`) |
| Register map | [docs/modbus-register-map.md](docs/modbus-register-map.md) |
| Configuration / EEPROM | [docs/configuration.md](docs/configuration.md) |
| Upload (bootloader over RS485) | [docs/firmware-upload.md](docs/firmware-upload.md) |

Hard constraints:

- The application must stay **below 0x3E00** (15872 bytes — bootloader). Only **~245 bytes are
  free**: V6 builds to 15 627 bytes flash / 948 bytes RAM. Check the program-memory figure after
  every build.
- Output macros expand to **two statements** — always brace `if`/`else` around them.
- In `TR20-Modbus`, wait with `delay_modbus()`, never `delay()`.
- Source comments are Italian, documentation is English.
- Never commit `build/`, `dist/`, `out/`, `_build/`, `cmake/`, `.generated_files/` or
  `nbproject/Makefile-local-default.mk`.
