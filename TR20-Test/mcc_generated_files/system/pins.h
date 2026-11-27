/**
 * Generated Pins Header File
 * 
 * @file pins.h
 * 
 * @defgroup  pinsdriver Pins Driver
 * 
 * @brief This file contains the API prototypes and function macros for the Pins driver.
 *
 * @version Driver Version  1.0.0
*/ 

/*
© [2026] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.? 
    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,  
    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S 
    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
    THIS SOFTWARE.
*/

#ifndef PINS_H_INCLUDED
#define PINS_H_INCLUDED

#include <avr/io.h>
#include "./port.h"
/**  
 * @ingroup  pinsdriver
 * @name Pin Function Macros
 * Macros for the individual pin functions.
 * @note These sets of macros are generated for all the selected pins in the Pins module.
 */
 ///@{

//get/set Rxd aliases
#define Rxd_SetHigh() do { PORTD |= 0x1; } while(0)
#define Rxd_SetLow() do { PORTD &= ~0x1; } while(0)
#define Rxd_Toggle() do { PIND |= 0x1; } while(0)
#define Rxd_GetValue() (PIND & (0x1 << 0))
#define Rxd_SetDigitalInput() do { DDRD &= ~0x1; } while(0)
#define Rxd_SetDigitalOutput() do { DDRD |= 0x1; } while(0)
#define Rxd_SetPullUp() do { PORTD |= 0x1; } while(0)
#define Rxd_ResetPullUp() do { PORTD &= ~0x1; } while(0)

//get/set Txd aliases
#define Txd_SetHigh() do { PORTD |= 0x2; } while(0)
#define Txd_SetLow() do { PORTD &= ~0x2; } while(0)
#define Txd_Toggle() do { PIND |= 0x2; } while(0)
#define Txd_GetValue() (PIND & (0x1 << 1))
#define Txd_SetDigitalInput() do { DDRD &= ~0x2; } while(0)
#define Txd_SetDigitalOutput() do { DDRD |= 0x2; } while(0)
#define Txd_SetPullUp() do { PORTD |= 0x2; } while(0)
#define Txd_ResetPullUp() do { PORTD &= ~0x2; } while(0)

//get/set Buzzer aliases
#define Buzzer_SetHigh() do { PORTB |= 0x2; } while(0)
#define Buzzer_SetLow() do { PORTB &= ~0x2; } while(0)
#define Buzzer_Toggle() do { PINB |= 0x2; } while(0)
#define Buzzer_GetValue() (PINB & (0x1 << 1))
#define Buzzer_SetDigitalInput() do { DDRB &= ~0x2; } while(0)
#define Buzzer_SetDigitalOutput() do { DDRB |= 0x2; } while(0)
#define Buzzer_SetPullUp() do { PORTB |= 0x2; } while(0)
#define Buzzer_ResetPullUp() do { PORTB &= ~0x2; } while(0)

//get/set K8 aliases
#define K8_SetHigh() do { PORTB |= 0x1; } while(0)
#define K8_SetLow() do { PORTB &= ~0x1; } while(0)
#define K8_Toggle() do { PINB |= 0x1; } while(0)
#define K8_GetValue() (PINB & (0x1 << 0))
#define K8_SetDigitalInput() do { DDRB &= ~0x1; } while(0)
#define K8_SetDigitalOutput() do { DDRB |= 0x1; } while(0)
#define K8_SetPullUp() do { PORTB |= 0x1; } while(0)
#define K8_ResetPullUp() do { PORTB &= ~0x1; } while(0)

//get/set K4 aliases
#define K4_SetHigh() do { PORTC |= 0x1; } while(0)
#define K4_SetLow() do { PORTC &= ~0x1; } while(0)
#define K4_Toggle() do { PINC |= 0x1; } while(0)
#define K4_GetValue() (PINC & (0x1 << 0))
#define K4_SetDigitalInput() do { DDRC &= ~0x1; } while(0)
#define K4_SetDigitalOutput() do { DDRC |= 0x1; } while(0)
#define K4_SetPullUp() do { PORTC |= 0x1; } while(0)
#define K4_ResetPullUp() do { PORTC &= ~0x1; } while(0)

//get/set K1 aliases
#define K1_SetHigh() do { PORTC |= 0x2; } while(0)
#define K1_SetLow() do { PORTC &= ~0x2; } while(0)
#define K1_Toggle() do { PINC |= 0x2; } while(0)
#define K1_GetValue() (PINC & (0x1 << 1))
#define K1_SetDigitalInput() do { DDRC &= ~0x2; } while(0)
#define K1_SetDigitalOutput() do { DDRC |= 0x2; } while(0)
#define K1_SetPullUp() do { PORTC |= 0x2; } while(0)
#define K1_ResetPullUp() do { PORTC &= ~0x2; } while(0)

//get/set K5 aliases
#define K5_SetHigh() do { PORTC |= 0x4; } while(0)
#define K5_SetLow() do { PORTC &= ~0x4; } while(0)
#define K5_Toggle() do { PINC |= 0x4; } while(0)
#define K5_GetValue() (PINC & (0x1 << 2))
#define K5_SetDigitalInput() do { DDRC &= ~0x4; } while(0)
#define K5_SetDigitalOutput() do { DDRC |= 0x4; } while(0)
#define K5_SetPullUp() do { PORTC |= 0x4; } while(0)
#define K5_ResetPullUp() do { PORTC &= ~0x4; } while(0)

//get/set K2 aliases
#define K2_SetHigh() do { PORTC |= 0x8; } while(0)
#define K2_SetLow() do { PORTC &= ~0x8; } while(0)
#define K2_Toggle() do { PINC |= 0x8; } while(0)
#define K2_GetValue() (PINC & (0x1 << 3))
#define K2_SetDigitalInput() do { DDRC &= ~0x8; } while(0)
#define K2_SetDigitalOutput() do { DDRC |= 0x8; } while(0)
#define K2_SetPullUp() do { PORTC |= 0x8; } while(0)
#define K2_ResetPullUp() do { PORTC &= ~0x8; } while(0)

//get/set K9 aliases
#define K9_SetHigh() do { PORTC |= 0x10; } while(0)
#define K9_SetLow() do { PORTC &= ~0x10; } while(0)
#define K9_Toggle() do { PINC |= 0x10; } while(0)
#define K9_GetValue() (PINC & (0x1 << 4))
#define K9_SetDigitalInput() do { DDRC &= ~0x10; } while(0)
#define K9_SetDigitalOutput() do { DDRC |= 0x10; } while(0)
#define K9_SetPullUp() do { PORTC |= 0x10; } while(0)
#define K9_ResetPullUp() do { PORTC &= ~0x10; } while(0)

//get/set K6 aliases
#define K6_SetHigh() do { PORTC |= 0x20; } while(0)
#define K6_SetLow() do { PORTC &= ~0x20; } while(0)
#define K6_Toggle() do { PINC |= 0x20; } while(0)
#define K6_GetValue() (PINC & (0x1 << 5))
#define K6_SetDigitalInput() do { DDRC &= ~0x20; } while(0)
#define K6_SetDigitalOutput() do { DDRC |= 0x20; } while(0)
#define K6_SetPullUp() do { PORTC |= 0x20; } while(0)
#define K6_ResetPullUp() do { PORTC &= ~0x20; } while(0)

//get/set Ka aliases
#define Ka_SetHigh() do { PORTD |= 0x10; } while(0)
#define Ka_SetLow() do { PORTD &= ~0x10; } while(0)
#define Ka_Toggle() do { PIND |= 0x10; } while(0)
#define Ka_GetValue() (PIND & (0x1 << 4))
#define Ka_SetDigitalInput() do { DDRD &= ~0x10; } while(0)
#define Ka_SetDigitalOutput() do { DDRD |= 0x10; } while(0)
#define Ka_SetPullUp() do { PORTD |= 0x10; } while(0)
#define Ka_ResetPullUp() do { PORTD &= ~0x10; } while(0)

//get/set Kc aliases
#define Kc_SetHigh() do { PORTD |= 0x20; } while(0)
#define Kc_SetLow() do { PORTD &= ~0x20; } while(0)
#define Kc_Toggle() do { PIND |= 0x20; } while(0)
#define Kc_GetValue() (PIND & (0x1 << 5))
#define Kc_SetDigitalInput() do { DDRD &= ~0x20; } while(0)
#define Kc_SetDigitalOutput() do { DDRD |= 0x20; } while(0)
#define Kc_SetPullUp() do { PORTD |= 0x20; } while(0)
#define Kc_ResetPullUp() do { PORTD &= ~0x20; } while(0)

//get/set K0 aliases
#define K0_SetHigh() do { PORTD |= 0x40; } while(0)
#define K0_SetLow() do { PORTD &= ~0x40; } while(0)
#define K0_Toggle() do { PIND |= 0x40; } while(0)
#define K0_GetValue() (PIND & (0x1 << 6))
#define K0_SetDigitalInput() do { DDRD &= ~0x40; } while(0)
#define K0_SetDigitalOutput() do { DDRD |= 0x40; } while(0)
#define K0_SetPullUp() do { PORTD |= 0x40; } while(0)
#define K0_ResetPullUp() do { PORTD &= ~0x40; } while(0)

//get/set K7 aliases
#define K7_SetHigh() do { PORTD |= 0x80; } while(0)
#define K7_SetLow() do { PORTD &= ~0x80; } while(0)
#define K7_Toggle() do { PIND |= 0x80; } while(0)
#define K7_GetValue() (PIND & (0x1 << 7))
#define K7_SetDigitalInput() do { DDRD &= ~0x80; } while(0)
#define K7_SetDigitalOutput() do { DDRD |= 0x80; } while(0)
#define K7_SetPullUp() do { PORTD |= 0x80; } while(0)
#define K7_ResetPullUp() do { PORTD &= ~0x80; } while(0)

//get/set K3 aliases
#define K3_SetHigh() do { PORTE |= 0x1; } while(0)
#define K3_SetLow() do { PORTE &= ~0x1; } while(0)
#define K3_Toggle() do { PINE |= 0x1; } while(0)
#define K3_GetValue() (PINE & (0x1 << 0))
#define K3_SetDigitalInput() do { DDRE &= ~0x1; } while(0)
#define K3_SetDigitalOutput() do { DDRE |= 0x1; } while(0)
#define K3_SetPullUp() do { PORTE |= 0x1; } while(0)
#define K3_ResetPullUp() do { PORTE &= ~0x1; } while(0)

//get/set Xtal aliases
#define Xtal_SetHigh() do { PORTB |= 0x40; } while(0)
#define Xtal_SetLow() do { PORTB &= ~0x40; } while(0)
#define Xtal_Toggle() do { PINB |= 0x40; } while(0)
#define Xtal_GetValue() (PINB & (0x1 << 6))
#define Xtal_SetDigitalInput() do { DDRB &= ~0x40; } while(0)
#define Xtal_SetDigitalOutput() do { DDRB |= 0x40; } while(0)
#define Xtal_SetPullUp() do { PORTB |= 0x40; } while(0)
#define Xtal_ResetPullUp() do { PORTB &= ~0x40; } while(0)

//get/set MiSo aliases
#define MiSo_SetHigh() do { PORTB |= 0x10; } while(0)
#define MiSo_SetLow() do { PORTB &= ~0x10; } while(0)
#define MiSo_Toggle() do { PINB |= 0x10; } while(0)
#define MiSo_GetValue() (PINB & (0x1 << 4))
#define MiSo_SetDigitalInput() do { DDRB &= ~0x10; } while(0)
#define MiSo_SetDigitalOutput() do { DDRB |= 0x10; } while(0)
#define MiSo_SetPullUp() do { PORTB |= 0x10; } while(0)
#define MiSo_ResetPullUp() do { PORTB &= ~0x10; } while(0)

//get/set MoSi aliases
#define MoSi_SetHigh() do { PORTB |= 0x8; } while(0)
#define MoSi_SetLow() do { PORTB &= ~0x8; } while(0)
#define MoSi_Toggle() do { PINB |= 0x8; } while(0)
#define MoSi_GetValue() (PINB & (0x1 << 3))
#define MoSi_SetDigitalInput() do { DDRB &= ~0x8; } while(0)
#define MoSi_SetDigitalOutput() do { DDRB |= 0x8; } while(0)
#define MoSi_SetPullUp() do { PORTB |= 0x8; } while(0)
#define MoSi_ResetPullUp() do { PORTB &= ~0x8; } while(0)

//get/set Sck aliases
#define Sck_SetHigh() do { PORTB |= 0x20; } while(0)
#define Sck_SetLow() do { PORTB &= ~0x20; } while(0)
#define Sck_Toggle() do { PINB |= 0x20; } while(0)
#define Sck_GetValue() (PINB & (0x1 << 5))
#define Sck_SetDigitalInput() do { DDRB &= ~0x20; } while(0)
#define Sck_SetDigitalOutput() do { DDRB |= 0x20; } while(0)
#define Sck_SetPullUp() do { PORTB |= 0x20; } while(0)
#define Sck_ResetPullUp() do { PORTB &= ~0x20; } while(0)

//get/set PowerOff aliases
#define PowerOff_SetHigh() do { PORTD |= 0x4; } while(0)
#define PowerOff_SetLow() do { PORTD &= ~0x4; } while(0)
#define PowerOff_Toggle() do { PIND |= 0x4; } while(0)
#define PowerOff_GetValue() (PIND & (0x1 << 2))
#define PowerOff_SetDigitalInput() do { DDRD &= ~0x4; } while(0)
#define PowerOff_SetDigitalOutput() do { DDRD |= 0x4; } while(0)
#define PowerOff_SetPullUp() do { PORTD |= 0x4; } while(0)
#define PowerOff_ResetPullUp() do { PORTD &= ~0x4; } while(0)

//get/set LoRaInt aliases
#define LoRaInt_SetHigh() do { PORTD |= 0x8; } while(0)
#define LoRaInt_SetLow() do { PORTD &= ~0x8; } while(0)
#define LoRaInt_Toggle() do { PIND |= 0x8; } while(0)
#define LoRaInt_GetValue() (PIND & (0x1 << 3))
#define LoRaInt_SetDigitalInput() do { DDRD &= ~0x8; } while(0)
#define LoRaInt_SetDigitalOutput() do { DDRD |= 0x8; } while(0)
#define LoRaInt_SetPullUp() do { PORTD |= 0x8; } while(0)
#define LoRaInt_ResetPullUp() do { PORTD &= ~0x8; } while(0)

//get/set LoRaBusy aliases
#define LoRaBusy_SetHigh() do { PORTE |= 0x2; } while(0)
#define LoRaBusy_SetLow() do { PORTE &= ~0x2; } while(0)
#define LoRaBusy_Toggle() do { PINE |= 0x2; } while(0)
#define LoRaBusy_GetValue() (PINE & (0x1 << 1))
#define LoRaBusy_SetDigitalInput() do { DDRE &= ~0x2; } while(0)
#define LoRaBusy_SetDigitalOutput() do { DDRE |= 0x2; } while(0)
#define LoRaBusy_SetPullUp() do { PORTE |= 0x2; } while(0)
#define LoRaBusy_ResetPullUp() do { PORTE &= ~0x2; } while(0)

//get/set SS_RFID aliases
#define SS_RFID_SetHigh() do { PORTB |= 0x4; } while(0)
#define SS_RFID_SetLow() do { PORTB &= ~0x4; } while(0)
#define SS_RFID_Toggle() do { PINB |= 0x4; } while(0)
#define SS_RFID_GetValue() (PINB & (0x1 << 2))
#define SS_RFID_SetDigitalInput() do { DDRB &= ~0x4; } while(0)
#define SS_RFID_SetDigitalOutput() do { DDRB |= 0x4; } while(0)
#define SS_RFID_SetPullUp() do { PORTB |= 0x4; } while(0)
#define SS_RFID_ResetPullUp() do { PORTB &= ~0x4; } while(0)

//get/set TxEn aliases
#define TxEn_SetHigh() do { PORTE |= 0x4; } while(0)
#define TxEn_SetLow() do { PORTE &= ~0x4; } while(0)
#define TxEn_Toggle() do { PINE |= 0x4; } while(0)
#define TxEn_GetValue() (PINE & (0x1 << 2))
#define TxEn_SetDigitalInput() do { DDRE &= ~0x4; } while(0)
#define TxEn_SetDigitalOutput() do { DDRE |= 0x4; } while(0)
#define TxEn_SetPullUp() do { PORTE |= 0x4; } while(0)
#define TxEn_ResetPullUp() do { PORTE &= ~0x4; } while(0)

//get/set SS_LoRa aliases
#define SS_LoRa_SetHigh() do { PORTE |= 0x8; } while(0)
#define SS_LoRa_SetLow() do { PORTE &= ~0x8; } while(0)
#define SS_LoRa_Toggle() do { PINE |= 0x8; } while(0)
#define SS_LoRa_GetValue() (PINE & (0x1 << 3))
#define SS_LoRa_SetDigitalInput() do { DDRE &= ~0x8; } while(0)
#define SS_LoRa_SetDigitalOutput() do { DDRE |= 0x8; } while(0)
#define SS_LoRa_SetPullUp() do { PORTE |= 0x8; } while(0)
#define SS_LoRa_ResetPullUp() do { PORTE &= ~0x8; } while(0)
///@}

/**
 * @ingroup  pinsdriver
 * @brief Initializes the General Purpose Input/Output (GPIO), peripheral I/O pins and related registers.
 * @param None.
 * @return None.
 */
void PIN_MANAGER_Initialize();

#endif /* PINS_H_INCLUDED */
