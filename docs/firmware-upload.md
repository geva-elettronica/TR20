# TR20 — loading the firmware onto the reader

The TR20 carries a **resident bootloader**, so you never need a programmer, a debugger or to open
the enclosure: the firmware travels over the **same RS485 bus** the reader uses for Modbus.

## What you need

| | |
|---|---|
| **Hardware** | a **USB → RS485 adapter** (any FTDI/CH340-class adapter with A/B terminals) |
| **Software** | **`Bootloader_v5.exe`**, from <https://download.gevaelettronica.it/Hotel/> |
| **Firmware** | the `.hex` your build produced — `TR20-Modbus/dist/default/production/TR20-Modbus.production.hex` |

The same download page also carries `TR20_ModBus+Library.zip`, a snapshot of the firmware sources.

## Procedure

1. **Wire the adapter to the bus.** Connect the adapter's `A`/`B` to the reader's RS485 pair
   (`A`↔`A`, `B`↔`B`) and power the reader from its normal supply. On a bench a single reader on
   the pair is easiest; on an installed bus the other slaves can stay connected.
2. **Note the reader's Modbus address and baud rate.** The bootloader addresses the device by its
   Modbus address, which the application stores in EEPROM — see
   [configuration.md](configuration.md). If you don't know it, read it back with a Modbus master, or
   re-run the keypad setup to set a known value.
3. **Run `Bootloader_v5.exe`**, select the adapter's COM port, the reader's address and baud rate,
   and load the `.hex` file.
4. **Start the upload** and leave the reader powered until it completes. The reader restarts into
   the new application on its own.
5. **Check it came up**: the green LEDs give a short "life" blink every 1.5 s, and the reader
   answers Modbus function 03 at its address.

## Flash budget — the one real constraint

The bootloader lives at **0x3E00** in the ATmega328PB's 32 KB flash, so the **application must stay
below 0x3E00** — 15872 bytes. If a build grows past that limit, the upload either fails or damages
the bootloader, and then the reader *does* need a programmer to be recovered.

**The margin is thin.** The V6 firmware in this repository builds to **15 627 bytes of flash** and
**948 bytes of RAM** with the free XC8 v3.10 — **245 bytes to spare**. (The free compiler ignores
the project's `-Os` request; with the PRO compiler the image is smaller.) Every feature you add has
to be paid for out of those 245 bytes, so measure before you upload.

Check the size after every build: the MPLAB build log prints the program memory used, and the
`.map` file in `dist/default/production/` gives the exact top address. Keep the project's
optimisation settings (`-O3`, LTO/WPO, `-mconst-data-in-progmem`) — they are what makes the firmware
fit.

## Clock and baud rates

The application runs the CPU at **8 MHz** (16 MHz crystal with `CLKPR` = /2, set in `main()` before
`initHw()`; at 3.3 V, 16 MHz is outside the device's safe operating area). All UART dividers, timer
reloads and `_delay_*()` calls therefore assume `F_CPU = 8000000`, defined in
`mcc_generated_files/system/cpu.h`.

> ⚠️ If you change the clock, you must revisit `F_CPU`, the `UBRR0` table in `main.c`, `OCR3A` in
> `Library/TR20_hw.c` (the 1 ms tick) and the buzzer divider in `play()`. The **bootloader also has
> its own idea of the clock**: a mismatch means the bootloader no longer talks at the expected baud
> rate. Device bootloader **V6** matches the 8 MHz configuration in this repository.

## If the upload does not start

- Swap `A` and `B` — reversed polarity is the usual cause.
- Make sure no Modbus master is polling the bus at the same time.
- Confirm the address and baud rate: the bootloader has to be spoken to at the rate the device uses.
- Check the adapter's termination/bias: PetitModbus' own note applies — an RS485 receiver needs a
  pull-up on RX, and a long line needs its 120 Ω terminations.
