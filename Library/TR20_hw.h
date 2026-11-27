/*
 * Hardware.h
 *
 * Created: 28/03/2023 14:17:53
 *  Author: x-gio
 * 
 * V4 migliorata lettura RFID, migrato su StudioX
 */ 


#ifndef HARDWARE_H_
#define HARDWARE_H_

#define _tc *(unsigned char*)&
#define _ti *(unsigned int*)&
#define _tl *(unsigned long*)&
#define _uc unsigned char
#define _sc signed char
#define _ui unsigned int
#define _si signed int
#define _ul unsigned long
#define _tcp (unsigned char *)&

#include "system/system.h"
#include "touch/touch.h"
#include "spi/spi0.h"
#include "mfrc630.h"
#include <stdint.h>
#include <string.h>
//#include <SX126x.h>
#include <avr/eeprom.h>
#include <avr/io.h>
#include "Timer.h"
#include <stdio.h>
//#include "uart/usart0.h"
// Dichiarazioni delle funzioni EEPROM - Singolo byte
void writeEEPROM(uint16_t address, uint8_t data);
uint8_t readEEPROM(uint16_t address);

// Dichiarazioni delle funzioni EEPROM - Blocchi di dati
void writeEEPROM_block(uint16_t address, const uint8_t* data, uint16_t length);
void readEEPROM_block(uint16_t address, uint8_t* data, uint16_t length);
// EEPROM map per bootloader
#define EE_Address 1		// 2 byte
#define EE_VerFw 3			// 1 byte
#define EE_TypFw 4			// 1 byte

// extern FILE uart_output; // Rimosso per disassociare UART da putchar

#define KA 10
#define KC 11

// Bit-Field
#define SetBit(x,y) ((x) |= (1<<y))
#define ResBit(x,y) ((x) &=(~(1<<y)))
#define ClearBit(x,y) ((x) &=(~(1<<y)))
#define CheckBit(x,y) ((x) & (1<<y))

// TR20_hw.h ora contiene solo funzioni comuni: touch, IO, buzzer, led, millis
// Le definizioni UART sono state spostate in define.h (specifiche del progetto)

//extern char cnt, forsec, CNTerrore, ResetErrori;
extern char forsec;
extern volatile unsigned long mil;
extern uint8_t uid[10];  // uids are maximum of 10 bytes long.
extern unsigned long Minuti;         // Assoluti, dal reset
extern uint8_t ckIn1_prev;
extern uint8_t ckIn2_prev;
extern char Modo;
extern uint8_t in, out;

extern Timer TimerSerratura;            // Timer per la temporizzazione della serratura
extern Timer TimerLuci;                // Timer per la temporizzazione delle luci
//extern Timer timeoutKey;
//extern unsigned long lastCard;

bool Key ( uint8_t * );
unsigned long millis( void );
void delay ( int );
bool rfid( void );		// Read card, return 1 if card is present (only once), code is on uid global
void initHw( void );

// Callback opzionale per mantenere attiva la comunicazione durante operazioni lunghe (es. Modbus)
extern void (*rfid_keepalive_callback)(void);
void play(int,int);		// Buzz sound, freq, time    Resonating 2700hz
void PlayLoRaErr(void);
void PlayNote(void);
void PlayPerElisa(void);
void PlayCardIn(void);
void PlayKey(void);
void PlayOk(void);
void PlayNo(void);
void PlayKeyReject(void);
void PlayRFIn(void);
void test_su_PORTD2(void);
int uart_putchar(char c, FILE *stream);

// SX126x  lora();

#define SetRedLed_ ResBit(out,4)
#define SetRedLed ResBit(out,4);mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define ResRedLed_ SetBit(out,4)
#define ResRedLed SetBit(out,4);mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define SetVibro ResBit(out,6);mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define ResVibro SetBit(out,6);mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define SetGreenLed_ ResBit(out,5)
#define SetGreenLed ResBit(out,5);mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define CkGreenLed !CheckBit(out,5)
#define ResGreenLed_ SetBit(out,5)
#define ResGreenLed SetBit(out,5);mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define SetK1 SetBit(out,7);mfrc630_write_reg(MFRC630_REG_PADOUT, out)  // Serratura
#define ResK1 ResBit(out,7);mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define SetK1_ SetBit(out,7)
#define ResK1_ ResBit(out,7)
#define ckK1 CheckBit(out,7)
#define SetK2_ SetBit(out,0)  // Luce
#define SetK2 SetBit(out,0);mfrc630_write_reg(MFRC630_REG_PADOUT, out)  // Luce
#define ResK2_ ResBit(out,0)
#define ResK2 ResBit(out,0);mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define ckK2 CheckBit(out,0)
#define Act	mfrc630_write_reg(MFRC630_REG_PADOUT, out)
#define BuzzOn	SetBit(TIMSK1,OCIE1A)
#define BuzzOff	ResBit(TIMSK1,OCIE1A);ResBit(PORTE,0)
#define LowBatt CheckBit(PIND,2)
#define CkLoRaBusy CheckBit(PINE,1)
#define SetLoRaSel ResBit(PORTE,3)
#define ResLoRaSel SetBit(PORTE,3)
#define ckRes  !CheckBit(in,1)
#define ckIn1  CheckBit(in,2)
#define ckIn2  CheckBit(in,3)
#define set_TxEn	SetBit(PORTE,2)
#define res_TxEn	ResBit(PORTE,2)
#define ck_TxEn		CheckBit(PORTE,2)
// loRa define
#define LoRaInt     PD3 INT1
#define LoRaBusy    PE1
#define SS_LoRa     PE3




#define DO4	  261
#define DO4_  277
#define RE4   293
#define RE4_  311
#define MI4   329
#define FA4   349
#define FA4_  370
#define SOL4  392
#define SOL4_ 415
#define LA4   440
#define LA4_  466
#define SI4   494
#define DO5   523
#define DO5_  554
#define RE5   587
#define RE5_  622
#define MI5   659
#define FA5   689
#define FA5_  689
#define SOL5  784
#define LA5   880
#define SI5   988
#define DO6   1046
#define RE6   1174
#define MI6   1318
#define FA6   1397
#define SOL6  1568
#define LA6   1760
#define SI6   1975
#define DO7   2093
#define RE7   2349
#define MI7   2637
#define FA7   2794
#define SOL7  3136
#define LA7   3520
#define SI7   3951

#endif /* HARDWARE_H_ */