#include "define.h"
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/power.h>
/*
	Per aumentare la sensibilit� quando in scatola stagna, si modifica il file touch.h
	44 #define DEF_TOUCH_MEASUREMENT_PERIOD_MS 20 --> 60
	71 #define DEF_SEL_FREQ_INIT FREQ_SEL_0 --> 15
	92 		X_NONE, Y(14), 0, PRSC_DIV_SEL_16, NODE_GAIN(GAIN_1, GAIN_1), FILTER_LEVEL_16 
	-->  	X_NONE, Y(14), 0, PRSC_DIV_SEL_16, NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_32
	idem tutte le righe sotto.
	153		9, HYST_25, NO_AKS_GROUP  
	-->		20, HYST_6_25, NO_AKS_GROUP
	idem tutte le righe sotto.
	204		#define DEF_TOUCH_DET_INT 4		--> 8
	211		#define DEF_ANTI_TCH_DET_INT 5  --> 10
	217		#define DEF_ANTI_TCH_RECAL_THRSHLD RECAL_100  -->  RECAL_6_25

	--------------- TROVI GLI ZIP nella cartella -------------
	
	FIX RS485 TRANSITORI TxEn:
	- ISR split: UDRE_vect per byte successivi, TX_vect (TXC) per disabilitare TxEn
	  solo DOPO che ultimo byte è completamente uscito (NO busy-waiting in interrupt!)
	- PetitModbus: reset buffer su CRC error per scartare caratteri spuri da transitori
	- TX_BUFFER_SIZE aumentato a 100 byte per messaggi Modbus lunghi
	
	FIX RFID/MODBUS DEFINITIVO:
	- ReceiveInterrupt() analizza AUTOMATICAMENTE i byte appena arrivano (byte 3 o 7)
	- Determina se messaggio è per altro slave e calcola lunghezza NELL'INTERRUPT
	- Inizia scarto IMMEDIATAMENTE senza aspettare ProcessPetitModbus()
	- rfid() con timing randomizzato (100-150ms) per evitare sincronizzazione con master
	- Callback rfid_keepalive per mantenere sistema Modbus attivo durante rfid()
	- Scarto funziona anche se rfid() blocca per ~10ms durante domanda+risposta altri slave
*/
// V2, allineato  EEPROM al  bootloadet.
// V3, aggiunto bit per stoppare blynk life.
// V4, migrazione su MPLAB-X e migliorato lettura card
// V5, aggiunto bit per abilitare/disabilitare tastiera
//     fix interferenza RFID/Modbus + transitori RS485 con interrupt TXC
//     analisi automatica messaggi nell'interrupt RX per scarto immediato altri slave
// V6, clock 8MHz (fuse CKDIV8 + CLKPR /2) per bootloader V6 a $3E00, UBRR riscalati
#define Ver 6

Timer timeoutKey;
uint8_t RxLen;
//uint8_t RxData[10];      

// Buffer per trasmissione
#define TX_BUFFER_SIZE 100
volatile char tx_buffer[TX_BUFFER_SIZE];
volatile uint8_t tx_head = 0;
volatile uint8_t tx_tail = 0;
volatile uint8_t tx_count = 0;
volatile bool tx_in_progress = false;

/* GESTIONE TX RS485 CON TxEn PRECISO:
 * - putch() avvia trasmissione: set_TxEn, invia primo byte, abilita UDRE interrupt
 * - UDRE_vect: invia byte successivi finché buffer non vuoto, poi abilita TXC interrupt
 * - TX_vect (TXC): scatta quando ULTIMO byte è COMPLETAMENTE uscito → res_TxEn sicuro
 * Questo evita transitori/eco su RS485 che corrompevano i messaggi Modbus
 */

void putch(char c){
    // Se il buffer è pieno, attendi che si liberi
    while(tx_count >= TX_BUFFER_SIZE);
    
    // Disabilita interrupts durante modifica buffer
    cli();
    
    // Aggiungi carattere al buffer
    tx_buffer[tx_head] = c;
    tx_head = (tx_head + 1) % TX_BUFFER_SIZE;
    tx_count++;
    
    // Se non c'è trasmissione in corso, avviala
    if(!tx_in_progress) {
        tx_in_progress = true;
        
        // Riabilita interrupts per permettere RX durante TX
        sei();
        
        set_TxEn;
        
        // Piccolo delay per stabilizzare RS485 dopo set_TxEn (pochi us)
        _delay_us(5);
        
        // Disabilita di nuovo per gestire buffer in modo atomico
        cli();
        
        // Invia primo carattere
        char first_char = tx_buffer[tx_tail];
        tx_tail = (tx_tail + 1) % TX_BUFFER_SIZE;
        tx_count--;
        
        while(!UART0_IsTxReady());
        UART0_Write(first_char);
        
        // Abilita interrupt UDRE per prossimi caratteri
        SetBit(UCSR0B, UDRIE0);
    }
    
    // Riabilita interrupts
    sei();
}

// Funzione putchar per compatibilità con PetitModbus
int putchar(int c) {
    putch((char)c);
    return c;
}


ISR(USART0_RX_vect) {
//	test_su_PORTD2();
	ReceiveInterrupt(UDR0);	
//	USART_0_rxd();
}

// Interrupt UDRE: Data Register Empty - pronto per prossimo byte
ISR(USART0_UDRE_vect) {
    // Se ci sono ancora caratteri da trasmettere
    if(tx_count > 0) {
        // Invia prossimo carattere
        char next_char = tx_buffer[tx_tail];
        tx_tail = (tx_tail + 1) % TX_BUFFER_SIZE;
        tx_count--;
        UART0_Write(next_char);
    } else {
        // Buffer vuoto, disabilita UDRE e abilita TXC per gestire fine trasmissione
        ResBit(UCSR0B, UDRIE0);
        SetBit(UCSR0A, TXC0);     // Reset flag TXC (si resetta scrivendo 1!)
        SetBit(UCSR0B, TXCIE0);   // Abilita interrupt Transmission Complete
    }
}

// Interrupt TXC: Transmission Complete - ultimo byte completamente trasmesso
// Routine testata dall'utente
ISR(USART0_TX_vect) {
    res_TxEn;                    // Disabilita TxEn quando trasmissione completata
    ResBit(UCSR0B, TXCIE0);      // Disabilita interrupt
    tx_in_progress = false;      // Segna trasmissione come completata
}

// Delay personalizzato che continua a processare Modbus durante l'attesa
void delay_modbus(int ms) {
    unsigned long start_time = millis();
    while(millis() - start_time < ms) {
        ProcessPetitModbus();
    }
}



int main(void){
#define CharCnt ((char*)&PetitRegisters)[0]
//	uint8_t CharCnt=0;
    CharCnt=0;
	uint8_t Conf[10],  tmp[10];			// il quinto, la sensibilit�, l'ho rimosso perch� non so come regolarla.
	uint8_t ConfCnt=0;
	uint16_t ModBusAddress;
	uint8_t tasto, ff_K1=0, ff_K2=0, Change=0, ff_LedR=0, ff_LedV=0;
	Timer TimerIO;
	Timer TimerK1;
	Timer TimerLife;
	Timer TimerRFID;
//	unsigned long TimerLoRa = millis();
//	uint8_t SendSTR[5] = { 0xFF,1,0,1,0 };

	// Clock CPU = 16MHz/2 = 8MHz (bootloader V6, fuse CKDIV8): a 3.3V 16MHz fuori SOA.
	// Prima di initHw: UART, timer, delay calcolati su F_CPU=8MHz
	cli();
	clock_prescale_set(clock_div_2);

	initHw();
//    printf("Init\n");
	
	// Inizializzazione timer
	Timer_init(&timeoutKey, 4000);
	Timer_init(&TimerIO, 100);
	Timer_init(&TimerK1, 4000);
	Timer_init(&TimerLife, 1500);
	Timer_init(&TimerRFID, 100);

	// Lettura configurazione dalla EEPROM
	readEEPROM_block(1, Conf, 6);
	
	if( Conf[2] == 0xff ){
		Conf[0] = 0;	// Addr Low
		Conf[1] = 0;	// Addr High
		Conf[2] = Ver;	// Firmware Version
		Conf[3] = 4;	// Firmware type 4 = Modbus
		Conf[4] = 6;	// Baud
		Conf[5] = 1;	// Tastiera abilitata di default
		// Scrittura configurazione nella EEPROM
		writeEEPROM_block(1, Conf, 6);
	}
	writeEEPROM(3, Conf[2]);// Firmware Version 

	play(SI5,100);
	delay_modbus(200);
    
	in = mfrc630_read_reg(MFRC630_REG_PADIN);		// Reset Iniziale
	Key(&tasto);

	if( ckRes ){
		SetRedLed;
		while(1){
			if( Key( &tasto ) ){
				SetVibro;
				play(SI4,100);
				delay_modbus(100);
				ResVibro;
				tmp[ConfCnt] = tasto;
				ConfCnt++;
			}
		if( ConfCnt == 5){		// alsetup leggo 5 tasti
			// tmp[] contiene valori 0-11, ma per l'indirizzo servono le cifre 0-9
			// Se il tasto fisico è "1", Key() restituisce 0, quindi devo interpretare come cifra
			ModBusAddress = (((uint16_t)tmp[0])*100) + (((uint16_t)tmp[1])*10) + tmp[2];
			Conf[0] = ModBusAddress & 0xFF;
			Conf[1] = (ModBusAddress >> 8) & 0xFF;
			Conf[2] = Ver;	// Firmware Version
			Conf[3] = 4;	// Firmware type 4 = Modbus
			Conf[4] = tmp[3]; // Baudrate
			Conf[5] = tmp[4]; // Abilitazione tastiera (0=disabilitata, 1=abilitata)
			// Scrittura configurazione nella EEPROM
			writeEEPROM_block(1, Conf, 6);
			// Feedback di conferma
			SetGreenLed;
			play(DO6,50);
			delay_modbus(100);
			play(RE6,100);
			delay_modbus(200);
			ResGreenLed;
			ResRedLed;
			break;
		}
		}
	}

	ModBusAddress = (((uint16_t)Conf[1])<<8) | Conf[0];

	// Inizializzazione UART0 tramite MCC
//	USART0_Initialize();
    // Module is in UART mode

    /* Abilita USART0 */
    PRR0 &= ~(1 << PRUSART0);

    UCSR0A = 1 << U2X0
           | 0 << MPCM0;   // Multi-processor mode disabilitato

    UCSR0B = 1 << RXCIE0   // Interrupt RX abilitato
           | 0 << TXCIE0   // Interrupt TX disabilitato
           | 0 << UDRIE0   // Data Register Empty interrupt disabilitato
           | 1 << RXEN0    // RX abilitato
           | 1 << TXEN0    // TX abilitato
           | 0 << UCSZ02;
    
    // Reset flag TXC e stato trasmissione all'init
    SetBit(UCSR0A, TXC0);
    tx_in_progress = false;
    tx_count = 0;
    tx_head = 0;
    tx_tail = 0;

    // UCSR0C configurato (commentato nel tuo codice) per:
    // - Modalit� asincrona
    // - Nessuna parit�
    // - 1 stop bit
    // - 8 bit dati
    // cio�: UCSZ01=1, UCSZ00=1

	// Sovrascrive il baudrate secondo configurazione EEPROM
	switch(Conf[4]){			//  baudrate
		case 0:				//  2400  -0.1%
			UBRR0 = 416;
			break;
		case 1:				//  4800  0.2%
			UBRR0 = 207;
			break;
		case 2:				//  9600  0.2%
			UBRR0 = 103;
			break;
		case 3:				//  14400  0.6%
			UBRR0 = 68;
			break;
		case 4:				//  19200  0.2%
			UBRR0 = 51;
			break;
		case 5:				//  28800  -0.8%
			UBRR0 = 34;
			break;
		case 6:				//  38400  0.2%
			UBRR0 = 25;
			break;
		case 7:				//  57600  2.1%
			UBRR0 = 16;
			break;
		case 8:				//  115200  -3.5% (limite a 8MHz)
			UBRR0 = 8;
			break;
		case 9:				//  250000  0%
			UBRR0 = 3;
			break;
	}

	// Abilitazione interrupt RX USART0 (MCC ha già configurato tutto il resto)
	SetBit(UCSR0B, RXCIE0);
	
	InitPetitModbus(ModBusAddress);
	
	// CRITICO: Registra callback per mantenere Modbus attivo durante rfid()
	// Questo previene la corruzione del filtro di discard quando rfid() blocca per ~10ms
	rfid_keepalive_callback = ProcessPetitModbus;


	while(1){
		ProcessPetitModbus();

		// Gestione LED verde life - accende dopo 1500ms, spegne dopo 30ms aggiuntivi
		if( Timer_stato(&TimerLife) && !CkGreenLed && !CheckBit(((char*)&PetitRegisters)[20],0)) {
			SetGreenLed;
			Timer_tempo(&TimerLife, 30); // Cambia a 30ms per spegnere
			Timer_reset(&TimerLife);
		}
		if( Timer_stato(&TimerLife) && CkGreenLed ){
			ResGreenLed;
			Timer_tempo(&TimerLife, 1500); // Ritorna a 1500ms per il prossimo ciclo
			Timer_reset(&TimerLife);
		}

		if( Timer_stato(&TimerIO) ){
			Timer_reset(&TimerIO);
			in = mfrc630_read_reg(MFRC630_REG_PADIN);
//			printf("%02X ", in);
//			if ( CheckBit(in,0) ) mfrc630_write_reg(MFRC630_REG_PADOUT, 1<<5);
//			else mfrc630_write_reg(MFRC630_REG_PADOUT, 0);
			if( ckIn1 )	SetBit(((char*)&PetitRegisters)[18],0);
			else  ResBit(((char*)&PetitRegisters)[18],0);
			if( ckIn2 )	SetBit(((char*)&PetitRegisters)[18],1);
			else ResBit(((char*)&PetitRegisters)[18],1);
  			if( ckRes )	SetBit(((char*)&PetitRegisters)[18],2);
			else  ResBit(((char*)&PetitRegisters)[18],2);
		}

		// Lettura tasti solo se abilitata (Conf[5] == 1)
		if( Conf[5] == 1 && Key( &tasto ) ){
//			 printf("Tasto %d\n", tasto);
			 SetVibro;
			 SetGreenLed;
			 play(SI4,100);
			 delay_modbus(40);
			 ResVibro;
			 ResGreenLed;
			 if(CharCnt < 12){
				 CharCnt++;
//				((char*)&PetitRegisters)[0] = CharCnt;
				if( tasto == 10 ) ((char*)&PetitRegisters)[CharCnt] = 42;
				else if( tasto == 11 ) ((char*)&PetitRegisters)[CharCnt] = 35;
				else ((char*)&PetitRegisters)[CharCnt] = tasto+48;
				Timer_reset(&timeoutKey);
				Timer_tempo(&TimerLife, 1500); Timer_reset(&TimerLife);
			 }
		}
		if( CharCnt && Timer_stato(&timeoutKey) ) {
			CharCnt = 0;
//			((char*)&PetitRegisters)[0] = 0;
			SetRedLed;
			delay_modbus(300);
			ResRedLed;
			Timer_tempo(&TimerLife, 1500); Timer_reset(&TimerLife);
		}		
		// Lettura RFID con timing randomizzato per evitare sincronizzazione con master
		// L'interrupt gestisce automaticamente lo scarto dei messaggi di altri slave
		if( Timer_stato(&TimerRFID) ){
			Timer_tempo(&TimerRFID, 100 + (rand() % 50));  // 100-150ms random
			Timer_reset(&TimerRFID);
			if( rfid() ){
				SetVibro;
				play(RE5,200);
				delay_modbus(40);
				ResVibro;			
				((char*)&PetitRegisters)[13] = 1;
				((char*)&PetitRegisters)[14] = uid[0];
				((char*)&PetitRegisters)[15] = uid[1];
				((char*)&PetitRegisters)[16] = uid[2];
				((char*)&PetitRegisters)[17] = uid[3];
			}
		}	
		if( CheckBit(((char*)&PetitRegisters)[19],0)){ // K1 Serr
			if(!ff_K1){
				ff_K1 = 1;
				Change = 1;
				SetK1_;
			}
		}else{
			if(ff_K1){
				ff_K1 = 0;
				Change = 1;
				ResK1_;
			}			
		}
		if( CheckBit(((char*)&PetitRegisters)[19],1)){ // K2 Luce
			if(!ff_K2){
				ff_K2 = 1;
				Change = 1;
				SetK2_;
			}
			}else{
			if(ff_K2){
				ff_K2 = 0;
				Change = 1;
				ResK2_;
			}
		}
		if( CheckBit(((char*)&PetitRegisters)[19],2)){ // Buzzer
			play(FA5,200);
			ResBit(((char*)&PetitRegisters)[19],2);
		}
		if( CheckBit(((char*)&PetitRegisters)[19],3)){ // Vibro
			SetVibro;
			delay_modbus(200);
			ResVibro;
			ResBit(((char*)&PetitRegisters)[19],3);
		}
		if( CheckBit(((char*)&PetitRegisters)[19],4)){ // Led Verdi
			Timer_tempo(&TimerLife, 1500); Timer_reset(&TimerLife);			
			if(!ff_LedV){
				ff_LedV = 1;
				Change = 1;
				SetGreenLed_;
			}
			}else{
			if(ff_LedV){
				ff_LedV = 0;
				Change = 1;
				ResGreenLed_;
			}
		}
		if( CheckBit(((char*)&PetitRegisters)[19],5)){ // Led Rossi
			if(!ff_LedR){
				ff_LedR = 1;
				Change = 1;
				SetRedLed_;
			}
			}else{
			if(ff_LedR){
				ff_LedR = 0;
				Change = 1;
				ResRedLed_;
			}
		}
		if( CheckBit(((char*)&PetitRegisters)[19],6)){ // OK
			SetK1;
			SetGreenLed;
			SetVibro;
			delay_modbus(100);
			ResVibro;
			play(DO6,50);
			delay_modbus(100);
			play(RE6,100);
			Timer_reset(&TimerK1);
			while(1){
				char statoIn1 = ckIn1;
				in = mfrc630_read_reg(MFRC630_REG_PADIN);
				ProcessPetitModbus();
				if( statoIn1 != ckIn1 || Timer_stato(&TimerK1) ){
					ResBit(((char*)&PetitRegisters)[19],6);
					ResK1;
					ResGreenLed;
					Timer_tempo(&TimerLife, 1500); Timer_reset(&TimerLife);
					break;
				}
				delay_modbus(100); // Fa anche aggiornamento modbus;
			}
			
		}
		if( CheckBit(((char*)&PetitRegisters)[19],7)){ // Errore
			SetRedLed;
			SetVibro;
			delay_modbus(100);
			ResVibro;
			play(RE5,50);
			delay_modbus(100);
			play(DO5,300);
			delay_modbus(400);
			ResRedLed;
			ResBit(((char*)&PetitRegisters)[19],7);
			Timer_tempo(&TimerLife, 1500); Timer_reset(&TimerLife);
		}
		if(Change){
			Act;
			Change = 0;
		}

		//if( millis()-TimerLoRa > 1000){
////			printf("millis\n");			
			//LoRaSend(SendSTR, 5,  SX126x_TXMODE_SYNC);
			//TimerLoRa = millis();
			//play(SI5,5);
		//}
		//
		//RxLen = LoRaReceive(RxData, 5);
		//if ( RxLen > 0 )
		//{
			//PlayPerElisa();
			//RFIn();
			//uint8_t rssi, snr;
			//LoRaReceiveStatus(&rssi, &snr);
			//printf("byte: %d, snr: %d, rssi: %d\n",RxLen,snr,rssi);
		//}
		
	}
}

