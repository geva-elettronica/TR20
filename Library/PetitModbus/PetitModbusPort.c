#include "PetitModbus.h"
#include "PetitModbusPort.h"

// Compilazione condizionale: progetto Wiegand o progetto RFID/Touch originale
#include "define.h"

#include <avr/io.h>
#include <util/delay.h>

#ifdef TR20_WIEGAND_PROJECT
    // Progetto Wiegand: non include TR20_hw.h, usa solo define.h
    // Definisci macro mancanti per accesso diretto ai registri AVR
    #ifndef UART0_IsTxReady
        #define UART0_IsTxReady()   (UCSR0A & (1 << UDRE0))
    #endif
    #ifndef UART0_Write
        #define UART0_Write(data)   (UDR0 = (data))
    #endif
#else
    // Progetto originale RFID/Touch: include TR20_hw.h
    #include "TR20_hw.h"
#endif

// This port file for PIC microcontrollers!

// Modbus RTU Variables
volatile unsigned char   PetitReceiveBuffer[PETITMODBUS_RECEIVE_BUFFER_SIZE];   // Buffer to collect data from hardware
volatile unsigned char   PetitReceiveCounter=0;                                 // Collected data number

// UART Initialize for Microconrollers, yes you can use another phsycal layer!
void PetitModBus_UART_Initialise(void)
{
// Insert UART Init Code Here
//    InitUART();
}

// Timer Initialize for Petit Modbus, 1ms Timer will be good for us!
void PetitModBus_TIMER_Initialise(void)
{
// Insert TMR Init Code Here
//    InitTMR1();
}

// This is used for send one character
void PetitModBus_UART_Putch(unsigned char c)
{
	putch(c);
}

// This is used for send string, better to use DMA for it ;)
unsigned char PetitModBus_UART_String(unsigned char *s, unsigned int Length)
{
    unsigned short  DummyCounter;
    extern volatile uint8_t tx_count, tx_head, tx_tail;
    extern volatile bool tx_in_progress;
    extern volatile char tx_buffer[100];  // TX_BUFFER_SIZE è 100 nel main.c
    #define TX_BUFFER_SIZE 100
    
    // CRITICO: Aggiungi TUTTI i byte al buffer atomicamente PRIMA di avviare trasmissione
    // Questo previene race condition dove UDRE interrupt vede buffer vuoto troppo presto
    
    // Attendi che eventuale trasmissione precedente sia completata
    while(tx_in_progress);
    
    cli();  // Disabilita interrupt durante copia buffer
    
    // Copia TUTTI i byte nel buffer circolare
    for(DummyCounter=0; DummyCounter<Length; DummyCounter++)
    {
        // Attendi che ci sia spazio nel buffer
        while(tx_count >= TX_BUFFER_SIZE);
        
        tx_buffer[tx_head] = s[DummyCounter];
        tx_head = (tx_head + 1) % TX_BUFFER_SIZE;
        tx_count++;
    }
    
    // Ora avvia trasmissione: tutti i byte sono già nel buffer
    tx_in_progress = true;

    sei();  // Riabilita interrupt brevemente

    set_TxEn;
    _delay_us(100);  // Stabilizza RS485 prima trasmissione (aumentato da 20 a 100 µs)

    cli();  // Disabilita per gestire primo byte
    
    // Invia primo carattere
    char first_char = tx_buffer[tx_tail];
    tx_tail = (tx_tail + 1) % TX_BUFFER_SIZE;
    tx_count--;

    // Attendi che UART sia pronto e invia primo byte
    while(!UART0_IsTxReady());
    UART0_Write(first_char);

    // Abilita interrupt UDRE per i byte rimanenti
    SetBit(UCSR0B, UDRIE0);
    
    sei();  // Riabilita interrupt
    
    return TRUE;
}

/*************************Interrupt Fonction Slave*****************************/
// Call this function into your UART Interrupt. Collect data from it!
// Better to use DMA
// ANALISI AUTOMATICA IN INTERRUPT: determina subito se il messaggio è per noi
void ReceiveInterrupt(unsigned char Data)
{
    // CONTROLLO TIMEOUT PRIMA DI TUTTO:
    // Se è passato troppo tempo dall'ultimo byte, il frame precedente è terminato
    // Azzera tutto e considera questo byte come inizio di un nuovo frame
    if(PetitModbusTimerValue >= PETITMODBUS_TIMEOUTTIMER)
    {
        // Timeout scaduto: frame precedente terminato/corrotto
        PetitReceiveCounter = 0;
        Petit_Rx_Discarding = FALSE;
        Petit_Rx_Discard_Count = 0;
        // Non fare return, elabora questo byte come primo di nuovo frame
    }
    
    // Se stiamo scartando messaggio di altro slave
    if(Petit_Rx_Discarding)
    {
        // Protezione: se il conteggio è eccessivo, qualcosa è andato storto
        if(Petit_Rx_Discard_Count > 255)
        {
            Petit_Rx_Discarding = FALSE;
            Petit_Rx_Discard_Count = 0;
            PetitReceiveCounter = 0;
            PetitModbusTimerValue = 0;
            return;
        }
        
        Petit_Rx_Discard_Count--;
        
        // Se abbiamo finito di scartare, torna in modalità normale
        if(Petit_Rx_Discard_Count == 0)
        {
            Petit_Rx_Discarding = FALSE;
        }
        
        // Azzera timer per prossimo byte
        PetitModbusTimerValue = 0;
        return;  // Scarta questo byte
    }
    
    // Ricezione normale - salva il byte
    PetitReceiveBuffer[PetitReceiveCounter] = Data;
    PetitReceiveCounter++;

    if(PetitReceiveCounter >= PETITMODBUS_RECEIVE_BUFFER_SIZE)  
        PetitReceiveCounter = 0;
    
    // ANALISI AUTOMATICA: appena abbiamo abbastanza byte, verifica se è per noi
    // Questo permette di scartare IMMEDIATAMENTE i messaggi di altri slave
    // SENZA aspettare ProcessPetitModbus()
    
    // Byte 0 = Indirizzo slave
    if(PetitReceiveCounter == 1)
    {
        // Se il primo byte NON è il nostro indirizzo, prepara lo scarto
        // Ma aspetta ancora per calcolare quanti byte scartare
        if(PetitReceiveBuffer[0] != PETITMODBUS_SLAVE_ADDRESS)
        {
            // Non è per noi, ma dobbiamo aspettare altri byte per capire la lunghezza
            // (non fare nulla qui, continua a ricevere)
        }
    }
    // Byte 1 = Function code
    else if(PetitReceiveCounter == 2)
    {
        // Abbiamo indirizzo + function, verifica se è per noi
        if(PetitReceiveBuffer[0] != PETITMODBUS_SLAVE_ADDRESS)
        {
            // Non è per noi, ma serve ancora capire la lunghezza del messaggio
            // Per funzioni 0x01-0x06 servono 8 byte (comando) o byte[2]+5 (risposta)
            // Per funzioni 0x0F-0x10 servono byte[6]+9 (comando) o 8 byte (risposta)
            // Aspettiamo ancora...
        }
    }
    // Byte 2 = terzo byte, utile per distinguere comando da risposta
    else if(PetitReceiveCounter == 3)
    {
        if(PetitReceiveBuffer[0] != PETITMODBUS_SLAVE_ADDRESS)
        {
            unsigned char func = PetitReceiveBuffer[1];
            unsigned int expectedLen = 0;
            
            // Funzioni 0x01-0x04: READ
            if(func >= 0x01 && func <= 0x04)
            {
                unsigned char byte2 = PetitReceiveBuffer[2];
                // Se byte2 è piccolo (< 125), probabilmente è ByteCount di una RISPOSTA
                if(byte2 > 0 && byte2 <= 125)
                {
                    expectedLen = 3 + byte2 + 2;  // Risposta: [Addr][Func][ByteCount][Data...][CRC]
                }
                else
                {
                    expectedLen = 8;  // Comando: [Addr][Func][AddrH][AddrL][CountH][CountL][CRC]
                }
                
                // Inizia scarto
                Petit_Rx_Discard_Count = expectedLen - PetitReceiveCounter;
                Petit_Rx_Discarding = TRUE;
                PetitReceiveCounter = 0;
                PetitModbusTimerValue = 0;  // Azzera timer per prossimo byte
                return;
            }
            // Funzioni 0x05-0x06: WRITE SINGLE (sempre 8 byte)
            else if(func == 0x05 || func == 0x06)
            {
                expectedLen = 8;
                Petit_Rx_Discard_Count = expectedLen - PetitReceiveCounter;
                Petit_Rx_Discarding = TRUE;
                PetitReceiveCounter = 0;
                PetitModbusTimerValue = 0;  // Azzera timer per prossimo byte
                return;
            }
            // Per 0x0F e 0x10 servono più byte (aspetta byte[6])
        }
    }
    // Byte 6 e oltre - per funzioni 0x0F/0x10
    else if(PetitReceiveCounter == 7)
    {
        if(PetitReceiveBuffer[0] != PETITMODBUS_SLAVE_ADDRESS)
        {
            unsigned char func = PetitReceiveBuffer[1];
            unsigned int expectedLen = 0;
            
            if(func == 0x0F || func == 0x10)
            {
                unsigned char byteCount = PetitReceiveBuffer[6];
                // Se byteCount è ragionevole (1-125), è un COMANDO
                if(byteCount > 0 && byteCount <= 125)
                {
                    expectedLen = 7 + byteCount + 2;  // [Addr][Func][Addr][Count][ByteCount][Data][CRC]
                }
                else
                {
                    expectedLen = 8;  // Risposta
                }
                
                Petit_Rx_Discard_Count = expectedLen - PetitReceiveCounter;
                Petit_Rx_Discarding = TRUE;
                PetitReceiveCounter = 0;
                PetitModbusTimerValue = 0;  // Azzera timer per prossimo byte
                return;
            }
        }
    }
    
    // SEMPRE azzera il timer alla fine, per ripartire il conteggio per il prossimo byte
    PetitModbusTimerValue = 0;
}

// Call this function into 1ms Interrupt or Event!
void PetitModBus_TimerValues(void)
{
    PetitModbusTimerValue++;
}
/******************************************************************************/
