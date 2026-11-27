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

#include <xc.h>
#include "../exint.h"

// Set the EXINT module to the options selected in the user interface.
void EXINT_Initialize(void) {
    // ISC1 FALLING_EDGE_OF_INTX; ISC0 FALLING_EDGE_OF_INTX; 
    EICRA = 0xA;
    // INTF1 disabled; INTF0 disabled; 
    EIFR = 0x0;
    // INT1 enabled; INT0 disabled; 
    EIMSK = 0x2;
    // PCIE 0x0; 
    PCICR = 0x0;
    // PCIF 0x0; 
    PCIFR = 0x0;
    // PCINT 0x0; 
    PCMSK0 = 0x0;
    // PCINT 0x0; 
    PCMSK1 = 0x0;
    // PCINT 0x0; 
    PCMSK2 = 0x0;
    // PCINT 0x0; 
    PCMSK3 = 0x0;
}
