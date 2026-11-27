/*
 * Hardware.h
 *
 * Created: 28/03/2023 14:17:53
 *  Author: x-gio
 */ 


#ifndef define_h
#define define_h

#include "TR20_hw.h"
#include "PetitModbus/PetitModbus.h"
#include "PetitModbus/PetitModbusPort.h"
#include "uart/usart0.h"
#include "system/system.h"


#define PROJECT_TIMER_UART_CALL PetitModbusTimerValue++
//#define PROJECT_TIMER_UART_CALL  
void putch(char c);

        
#endif /* define_h */