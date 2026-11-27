/**
  * TC3 Generated Driver File
  *
  * @file tc3.c
  *
  * @ingroup tc3
  *
  * @brief This file contains the API implementations for the TC3 module driver.
  *
  * @version TC3 Driver Version 1.0.0
*/

/*
© [2025] Microchip Technology Inc. and its subsidiaries.

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
#include <avr/io.h>
#include "../tc3.h"

int8_t TC3_Initialize(void) 
{
    //Compare A
    OCR3A = 0x0;

    //Compare B
    OCR3B = 0x0;

    //Input Capture
    ICR3 = 0x0;

    //Count
    TCNT3 = 0x0;


    //COM3A 0; COM3B 0; WGM3 0; 
    TCCR3A = 0x0;

    //CS3 RUNNING_NO_PRESCALING; ICES3 disabled; ICNC3 disabled; WGM3 1; 
    TCCR3B = 0x9;

    //FOC3A disabled; FOC3B disabled; 
    TCCR3C = 0x0;

    //ICIE3 disabled; OCIE3A enabled; OCIE3B disabled; TOIE3 disabled; 
    TIMSK3 = 0x2;

    return 0;
}

bool TC3_Get_Overflow_InterruptFlagStatus(void)
{
    if (TIFR3  & TOV3) {
        return true;
    } else {
        return false;
    }
}

bool TC3_Get_CompareA_InterruptFlagStatus(void)
{
    if (TIFR3  & OCF3A) {
        return true;
    } else {
        return false;
    }
}

bool TC3_Get_CompareB_InterruptFlagStatus(void)
{
    if (TIFR3  & OCF3B) {
        return true;
    } else {
        return false;
    }
}

void TC3_Enable_Overflow_Interrupt(void)
{
    TIMSK3 |= (1 << TOIE3);
}

void TC3_Disable_Overflow_Interrupt(void)
{
    TIMSK3 &= ~(1 << TOIE3);
}

void TC3_Enable_CompareA_Interrupt(void)
{
    TIMSK3 |= (1 << OCIE3A);
}

void TC3_Disable_CompareA_Interrupt(void)
{
    TIMSK3 &= ~(1 << OCIE3A);
}

void TC3_Enable_CompareB_Interrupt(void)
{
    TIMSK3 |= (1 << OCIE3B);
}

void TC3_Disable_CompareB_Interrupt(void)
{
    TIMSK3 &= ~(1 << OCIE3B);
}

void TC3_WriteTimer(uint16_t timerValue)
{
    TCNT3 = timerValue;
}

uint16_t TC3_ReadTimer(void)
{
    return TCNT3;
}

//ISR(TIMER3_COMPA_vect)
//{
    //clears the Compare A interrupt flag
//    TIFR3 = OCF3A;

    /* Insert your Compare A interrupt handling code here */
    
//}

ISR(TIMER3_COMPB_vect)
{
    //clears the Compare B interrupt flag
    TIFR3 = OCF3B;

    /* Insert your Compare B interrupt handling code here */
    
}

ISR(TIMER3_OVF_vect)
{
    //clears the Overflow interrupt flag
    TIFR3 = TOV3;

    /* Insert your Overflow interrupt handling code here */
    
}

ISR(TIMER3_CAPT_vect)
{
    //clears the Overflow interrupt flag
    TIFR3 = ICF3;

    /* Insert your Overflow interrupt handling code here */
    
}

