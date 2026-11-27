/*
 * hardware.c
 *
 * Created: 28/03/2023 14:18:26
 *  Author: x-gio
 * 
 * IMPORTANTE - Gestione interferenza RFID/Modbus:
 * 
 * PROBLEMA IDENTIFICATO CON OSCILLOSCOPIO:
 * - rfid() esegue operazioni SPI che durano ~10ms (WUPA + REQA + SELECT)
 * - Durante questi 10ms, ProcessPetitModbus() NON viene chiamato
 * - Se arriva traffico Modbus destinato ad altri slave, la libreria PetitModbus
 *   deve calcolare quanti byte scartare (Petit_Rx_Discard_Count) e impostare
 *   il flag Petit_Rx_Discarding
 * - MA se ProcessPetitModbus() non viene chiamato per 10ms, il buffer si riempie
 *   di byte non processati e la macchina a stati Modbus entra in stato inconsistente
 * - Risultato: il modulo NON risponde pi� alle richieste successive, anche se
 *   arrivano 100ms dopo (ben oltre il timeout di 25ms)
 * 
 * SOLUZIONE IMPLEMENTATA:
 * - Callback rfid_keepalive_callback() che viene chiamata TRE volte durante rfid():
 *   1. Dopo mfrc630_iso14443a_WUPA()
 *   2. Dopo mfrc630_iso14443a_REQA() (se WUPA fallisce)
 *   3. Dopo mfrc630_iso14443a_select()
 * - Il main.c registra ProcessPetitModbus come callback
 * - Questo mantiene attiva la macchina a stati Modbus anche durante rfid()
 * - Il filtro di discard funziona correttamente anche con rfid() in corso
 */ 

// Compilazione condizionale: progetto Wiegand include define.h per PROJECT_TIMER_UART_CALL
#ifdef TR20_WIEGAND_PROJECT
    #include "define.h"  // Include configurazione progetto (con PROJECT_TIMER_UART_CALL)
#else
    //#include "define.h"  // Commentato per altri progetti (in TR20keycode crea doppi timer)
#endif

#include "TR20_hw.h"

uint8_t out, in, ffkey;
volatile unsigned long mil = 0 ;
//char cnt = 0, forsec = 0, CNTerrore = 0, ResetErrori = 0;
char forsec = 0;
extern volatile uint8_t measurement_done_touch;
uint8_t uid[10] = {0};  // uids are maximum of 10 bytes long.
volatile uint16_t BuzzTime;
//unsigned long lastCard;       // L'ultima card che apre è quella che accende i carichi

// Callback per mantenere attiva la comunicazione durante rfid() (es. ProcessPetitModbus)
void (*rfid_keepalive_callback)(void) = 0;

// Funzioni EEPROM usando avr/eeprom.h (libreria standard AVR)

uint8_t readEEPROM(uint16_t address) {
    while(EECR & (1<<EEPE));     // Attendi scrittura precedente
    EEAR = address;
    EECR |= (1<<EERE);
    return EEDR;
}

void writeEEPROM(uint16_t address, uint8_t data) {
    if(readEEPROM(address) == data) return;   // Scrivi solo se diverso
    while(EECR & (1<<EEPE));
    // EEPE va scritto ENTRO 4 cicli da EEMPE: un interrupt (Timer3, RX, buzzer)
    // tra le due istruzioni fa fallire la scrittura in silenzio. Protetto con cli().
    uint8_t sreg = SREG;
    cli();
    EEAR = address;
    EEDR = data;
    EECR |= (1<<EEMPE);
    EECR |= (1<<EEPE);
    SREG = sreg;
    while(EECR & (1<<EEPE));     // Attendi fine scrittura corrente
}

void writeEEPROM_block(uint16_t address, const uint8_t* data, uint16_t length) {
    for(uint16_t i = 0; i < length; i++) writeEEPROM(address + i, data[i]);
}

void readEEPROM_block(uint16_t address, uint8_t* data, uint16_t length) {
    for(uint16_t i = 0; i < length; i++) data[i] = readEEPROM(address + i);
}

void mfrc630_noBS(void) {
	uint8_t parameters[3] = {(uint8_t) (0x21 >> 8), (uint8_t) (0x21 & 0xFF), 2};
	mfrc630_flush_fifo();
	mfrc630_write_fifo(parameters, 3);
	mfrc630_write_reg(MFRC630_REG_COMMAND, MFRC630_CMD_WRITEE2);
}

void test_su_PORTD2(void){
//	delay(1);
	SetBit(DDRD,2);		// Pin di test.
	if(CheckBit(PORTD,2)) ResBit(PORTD,2);
	else SetBit(PORTD,2);
}

void initHw( void ){

    SYSTEM_Initialize();
    
    OCR3A = (F_CPU/1000UL);  // 1mS (16MHz=0x3E80, 8MHz=8000) Dovrebbe impostarlo MCC ma non lo fa.
	delay(100);

	RFID.Open(HOST_CONFIG); 
    
	mfrc630_noBS(); 
	mfrc630_AN1102_recommended_registers(MFRC630_PROTO_ISO14443A_106_MILLER_MANCHESTER);
	mfrc630_write_reg(MFRC630_REG_PADEN, 0b11110001);    // Output Enable
	mfrc630_write_reg(MFRC630_REG_IRQ1EN, 0b01100000);   // Interrupt
	
	// Configurazione più aggressiva per la rilevazione delle carte
	// Configuro il ricevitore per essere più sensibile
	mfrc630_write_reg(MFRC630_REG_RXANA, 0x03);          // Massimo guadagno del ricevitore analogico
	// Riduco la soglia di rilevazione per essere più sensibile
	mfrc630_write_reg(MFRC630_REG_RXTHRESHOLD, 0x30);    // Soglia più bassa per rilevazione
	// Disabilito completamente l'LPCD (Low Power Card Detection)
	mfrc630_write_reg(MFRC630_REG_LPCD_QMIN, 0x00);      // Disabilita LPCD
	mfrc630_write_reg(MFRC630_REG_LPCD_QMAX, 0x00);      // Disabilita LPCD

	ResRedLed;
	ResGreenLed;
	ResVibro;
	res_TxEn;
		
}

ISR(TIMER1_COMPA_vect){		// Buzzer PB1
	if(CheckBit(PORTB,1)) ResBit(PORTB,1);
	else SetBit(PORTB,1);
	// Play
	if(!--BuzzTime){		// End Sound
		ResBit(TIMSK1,OCIE1A);
		ResBit(PORTB,1);
	}
}
ISR(TIMER3_COMPA_vect){  // 1mS
	// Chiamata UART specifica del progetto (se definita)
	#ifdef PROJECT_TIMER_UART_CALL
		PROJECT_TIMER_UART_CALL;
	#endif

  	static int _millisecondi = 0;
	mil++; 
  	if ( ++_millisecondi >= 1000 ) {
    	_millisecondi = 0;
    	forsec++;
  	}
}
void delay( int i )	{
	unsigned long _millis = millis();
	while(millis()-_millis<i);
}

bool rfid( void ) {		// Read card, return 1 if card is present (only once)
	static uint32_t lastCardUID = 0;        // UID dell'ultima carta letta
	static unsigned long lastReadTime = 0;   // Timestamp dell'ultima lettura
	static uint8_t cardPresent = 0;          // Flag per indicare se c'è una carta presente
	uint8_t sak;	
	
	// Provo prima con WUPA (Wake-Up) che è più aggressivo di REQA
	uint16_t atqa = mfrc630_iso14443a_WUPA();
	
	// CRITICO: Mantieni attiva la comunicazione (es. Modbus) tra operazioni RFID lunghe
	if(rfid_keepalive_callback) rfid_keepalive_callback();
	
	if (!atqa) {
		// Se WUPA non funziona, provo con REQA come backup
		atqa = mfrc630_iso14443a_REQA();
		if(rfid_keepalive_callback) rfid_keepalive_callback();
	}
	
	unsigned long currentTime = millis();
	
	if( atqa && mfrc630_iso14443a_select(uid, &sak) )
	{
		// CRITICO: Mantieni attiva la comunicazione dopo la select (operazione più lunga)
		if(rfid_keepalive_callback) rfid_keepalive_callback();
		
		// Calcolo l'UID come numero a 32 bit per il confronto
		uint32_t currentUID = (uint32_t)uid[0] | ((uint32_t)uid[1] << 8) | 
		                      ((uint32_t)uid[2] << 16) | ((uint32_t)uid[3] << 24);
		
		// Se è la stessa carta di prima e è ancora presente, non fare nulla
		if (cardPresent && currentUID == lastCardUID) {
			lastReadTime = currentTime; // Aggiorna il timestamp di presenza
			return 0; // Non segnalare di nuovo la stessa carta
		}
		
		// Se è una carta nuova o se la carta precedente era stata rimossa
		if (!cardPresent || currentUID != lastCardUID) {
			lastCardUID = currentUID;
			lastReadTime = currentTime;
			cardPresent = 1;
//			fprintf(&uart_output, "UID: %02X %02X %02X %02X\n",uid[0],uid[1],uid[2],uid[3]);
			return 1; // Segnala la nuova carta
		}
	}
	else {
		// Nessuna carta rilevata
		// Se era presente una carta e non la vediamo più da 500ms, considerala rimossa
		if (cardPresent && (currentTime - lastReadTime > 500)) {
			cardPresent = 0;
			lastCardUID = 0;
		}
	}
	
	return 0;
}

bool Key ( uint8_t *c )
{
	static char ffkey = 0;
	touch_process();
	if (measurement_done_touch == 1) {
		char localkey = 0;
		measurement_done_touch = 0;
		     if( get_sensor_state(0) & KEY_TOUCHED_MASK ) localkey = 1;
		else if( get_sensor_state(1) & KEY_TOUCHED_MASK ) localkey = 2;
		else if( get_sensor_state(2) & KEY_TOUCHED_MASK ) localkey = 3;
		else if( get_sensor_state(3) & KEY_TOUCHED_MASK ) localkey = 4;
		else if( get_sensor_state(4) & KEY_TOUCHED_MASK ) localkey = 5;
		else if( get_sensor_state(5) & KEY_TOUCHED_MASK ) localkey = 6;
		else if( get_sensor_state(6) & KEY_TOUCHED_MASK ) localkey = 7;
		else if( get_sensor_state(7) & KEY_TOUCHED_MASK ) localkey = 8;
		else if( get_sensor_state(8) & KEY_TOUCHED_MASK ) localkey = 9;
		else if( get_sensor_state(9) & KEY_TOUCHED_MASK ) localkey = 10;
		else if( get_sensor_state(10) & KEY_TOUCHED_MASK ) localkey = 11;
		else if( get_sensor_state(11) & KEY_TOUCHED_MASK ) localkey = 12;
		if( localkey && !ffkey ){
			*c = localkey-1;
			ffkey = 1;
			return 1;
		}
		if( !localkey )	ffkey = 0;
	}
	return 0;
}

void play(int f,int t){		// Buzz sound, freq, time    Resonating 2700hz
	OCR1A = (F_CPU/2UL)/f;    // xtal / 2 / f
//  t * 1000 = uS
//	1000000 / f = uS
//	Time 1mS, se scan 0.1mS allora 10cnt
	BuzzTime = (long)t * 1000L / (1000000L / (long)f);
	SetBit(TIMSK1,OCIE1A);	
}

unsigned long millis(){
	unsigned long m;
	uint8_t oldSREG = SREG;
	// disable interrupts while we read timer0_millis or we might get an
	// inconsistent value (e.g. in the middle of a write to timer0_millis)
	cli();
	m = mil;
	SREG = oldSREG;
	return m;
}
void PlayNo( void ){
    SetRedLed;
	SetVibro;
	delay(100);
	ResVibro;
	play(RE5,50);
	delay(50);
	play(DO5,300);
	ResRedLed;
}

void PlayOk( void ){
//	CNTerrore = 0;
//	ResetErrori = 0;
//	cnt = 0;
	SetGreenLed;
	SetVibro;
	delay(100);
	ResVibro;
	play(DO6,50);
	delay(50);
	play(RE6,100);
	ResGreenLed;
}
void PlayKey( void ){
	SetGreenLed;
	SetVibro;
	play(SI4, 100);
	delay(40);
	ResVibro;
	ResGreenLed;
}
void PlayKeyReject( void ){
	SetRedLed;
	SetVibro;
	play(SI4, 100);
	delay(40);
	ResVibro;
	ResRedLed;
}

void PlayNote( void ){
	play(DO4,100);
	delay(200);
	play(RE4,100);
	delay(200);
	play(MI4,100);
	delay(200);
	play(FA4,100);
	delay(200);
	play(SOL4,100);
	delay(200);
	play(LA4,100);
	delay(200);
	play(SI4,100);
	delay(200);
	play(DO5,100);
	delay(200);
	play(RE5,100);
	delay(200);
	play(MI5,100);
	delay(200);
	play(FA5,100);
	delay(200);
	play(SOL5,100);
	delay(200);
	play(LA5,100);
	delay(200);
	play(SI5,100);
	delay(200);
	play(DO6,100);
	delay(200);
	play(RE6,100);
	delay(200);
	play(MI6,100);
	delay(200);
	play(FA6,100);
	delay(200);
	play(SOL6,100);
	delay(200);
	play(LA6,100);
	delay(200);
	play(SI6,100);
	delay(200);
	play(DO7,100);
	delay(200);
	play(RE7,100);
	delay(200);
	play(MI7,100);
	delay(200);
	play(FA7,100);
	delay(200);
	play(SOL7,100);
	delay(200);
	play(LA7,100);
	delay(200);
	play(SI7,100);
	delay(200);
}

void PlayLoRaErr(void){
	play(DO5,100);
	delay(150);
	play(SOL4,100);
	delay(150);
	play(DO5,100);
	delay(150);
	play(SOL4,100);
	delay(150);
	play(MI4,100);
	delay(150);
}

void PlayCardIn(void){
	play(DO4,100);
	delay(100);
	play(SOL6,100);
	delay(100);
	play(DO4,100);
	delay(100);
	play(SOL6,100);
	delay(100);
	play(DO4,100);
	delay(200);
	play(SOL6,100);
	delay(200);
}

void PlayPerElisa( void ){
	play(MI5,263);
	delay(263);
	play(RE5_,263);
	delay(263);
	play(MI5,263);
	delay(263);
	play(RE5_,263);
	delay(263);
	play(MI5,263);
	delay(263);
	play(SI4,263);
	delay(263);
	play(RE5,263);
	delay(263);
	play(DO5,263);
	delay(263);

	play(LA4,562);
	delay(562);
	
	delay(263);
	
	play(DO4,263);
	delay(263);
	play(MI4,263);
	delay(263);
	play(LA4,263);
	delay(263);

	play(SI4,562);
	delay(562);

	delay(263);

	play(MI4,263);
	delay(263);
	play(SOL4_,263);
	delay(263);
	play(SI4,263);
	delay(263);

	play(DO5,562);
	delay(562);
	
}

void PlayRFIn(void){
	play(SOL6,100);
	delay(150);
	play(SOL6,100);
	delay(150);
	play(SOL6,100);
	delay(150);
	play(DO4,100);
	delay(150);
}

