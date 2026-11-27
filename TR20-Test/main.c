 /*
 GEVA elettronica
  * 
*/
#include "define.h"
#include <avr/interrupt.h>
#include <avr/power.h>

//uint8_t RxLen;
//uint8_t RxData[10];
unsigned long TimerIO;

// Variabili per gestione flip-flop dei relè
uint8_t K1_state = 0;   // Stato attuale del relè K1 (0=spento, 1=acceso)
uint8_t K2_state = 0;   // Stato attuale del relè K2 (0=spento, 1=acceso)
uint8_t ckIn1_prev = 0; // Stato precedente dell'ingresso 1
uint8_t ckIn2_prev = 0; // Stato precedente dell'ingresso 2

int main(void)
{
    uint8_t tasto;
	// Clock CPU = 16MHz/2 = 8MHz (bootloader V6, fuse CKDIV8): a 3.3V 16MHz fuori SOA.
	// Prima di initHw: UART, timer, delay calcolati su F_CPU=8MHz
	cli();
	clock_prescale_set(clock_div_2);

    initHw();
    play(SI4,100);

    set_TxEn;

//    fprintf(&uart_output, "Test TR%d\r\n", 20);
//    fputs("geva\r\n", &uart_output);
    delay(100);
    play(SI5,100);

    while(1){

		if( millis() - 100 >= TimerIO){
            TimerIO = millis();
            in = mfrc630_read_reg(MFRC630_REG_PADIN);
            if( ckRes ){
                SetVibro;
                delay(100);
                ResVibro;
                delay(100);
            }
            // Gestione flip-flop per K1 con rilevamento fronte di salita
            if( ckIn1 && !ckIn1_prev ){ // Fronte di salita su ckIn1
                K1_state = !K1_state;   // Inverte lo stato
                if(K1_state) { 
                    SetK1; 
                } else { 
                    ResK1; 
                }
            }
            ckIn1_prev = ckIn1;  // Aggiorna stato precedente
            
            // Gestione flip-flop per K2 con rilevamento fronte di salita  
            if( ckIn2 && !ckIn2_prev ){ // Fronte di salita su ckIn2
                K2_state = !K2_state;   // Inverte lo stato
                if(K2_state) { 
                    SetK2; 
                } else { 
                    ResK2; 
                }
            }
            ckIn2_prev = ckIn2;  // Aggiorna stato precedente

            if( rfid() ) PlayCardIn();

        } 

        if( Key( &tasto ) ){
          set_TxEn;
//          fprintf(&uart_output, "Tasto %d\r\n", tasto);
          SetVibro;
          play(SI4,100);
          delay(40);
          ResVibro;
              
          if(tasto==1) SetRedLed;
          if(tasto==2) ResRedLed;
          if(tasto==3) SetGreenLed;
          if(tasto==4) ResGreenLed;
          if(tasto==5) SetRedLed;
          if(tasto==6) ResRedLed;
          if(tasto==7) SetGreenLed;
          if(tasto==8) ResGreenLed;
          if(tasto==5) SetK1;
          if(tasto==6) ResK1;
          if(tasto==7) SetK2;
          if(tasto==8) ResK2;
        }
    }    
}