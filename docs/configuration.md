# TR20 — configuration from the keypad

The TR20 keeps its bus configuration in the ATmega328PB **internal EEPROM**. There is no
configuration over Modbus: the parameters are entered **on the reader's own keypad**, so a device
can be commissioned on site with nothing but a finger.

## EEPROM map

| Address | Bytes | Content |
|---------|-------|---------|
| 1 | 1 | Modbus slave address, **low** byte |
| 2 | 1 | Modbus slave address, **high** byte |
| 3 | 1 | **firmware version** (`Ver` in `main.c`, currently 6) — rewritten at every boot |
| 4 | 1 | **firmware type**: `4` = Modbus |
| 5 | 1 | **baud rate index** (table below) |
| 6 | 1 | **keypad enable**: `0` = keypad ignored, `1` = keypad active |

Addresses 1–4 are the block the **bootloader** also reads, which is how the upload tool identifies
the device on the bus — do not repurpose them.

At the first boot of a blank device (EEPROM address 3 reads `0xFF`) the firmware writes the
defaults: address `0`, version, type `4`, baud index `6` (38400) and keypad enabled.

## Baud rate index

| Index | Baud rate | UBRR @ 8 MHz, U2X | Error |
|-------|-----------|-------------------|-------|
| 0 | 2400 | 416 | −0.1 % |
| 1 | 4800 | 207 | 0.2 % |
| 2 | 9600 | 103 | 0.2 % |
| 3 | 14400 | 68 | 0.6 % |
| 4 | 19200 | 51 | 0.2 % |
| 5 | 28800 | 34 | −0.8 % |
| 6 | 38400 | 25 | 0.2 % |
| 7 | 57600 | 16 | 2.1 % |
| 8 | 115200 | 8 | −3.5 % |
| 9 | 250000 | 3 | 0 % |

Index 8 (115200) is at the edge of what an 8 MHz AVR can do: −3.5 % error works against a tolerant
master but is not recommended for long lines. 250000 is exact.

## Entering setup

Setup is entered **only at power-up**, and only if the setup contact is active:

1. Close the **setup/reset contact** (`ckRes`) and power the reader up — or keep it closed and
   reset the reader.
2. The **red LEDs light up steadily**: the reader is in setup and waits for exactly **five**
   keypresses. Each press beeps and gives a vibration pulse.
3. Press the five values in this order:

   | # | Value | Meaning |
   |---|-------|---------|
   | 1 | 0…9 | Modbus address, **hundreds** digit |
   | 2 | 0…9 | Modbus address, **tens** digit |
   | 3 | 0…9 | Modbus address, **units** digit |
   | 4 | 0…9 | **baud rate index** (table above) |
   | 5 | 0 / 1 | **keypad enable** (0 = disabled, 1 = enabled) |

4. The **green LEDs light up** and two confirmation notes play: the configuration is written to
   EEPROM and the reader starts normally with the new settings.

Example — address 12, 38400 baud, keypad enabled: `0`, `1`, `2`, `6`, `1`.

> The three digits are read as the **touch-key index** returned by `Key()`, which is not necessarily
> the number silk-screened on the panel (see the comment in `TR20-Modbus/main.c`, where the author
> notes the offset on his units). Verify on a sample unit before writing a commissioning procedure
> for the field, or change the mapping in `main.c` to match your panel.

## Changing the defaults in the firmware

Everything above lives in `TR20-Modbus/main.c`:

- `#define Ver 6` — firmware version written to EEPROM;
- the `if( Conf[2] == 0xff )` block — the factory defaults;
- the `if( ckRes )` block — the setup sequence (number of keys, the order and what each one means);
- the `switch(Conf[4])` block — the baud rate table.
