/**
 * TC3 Generated Driver API Header File
 *
 * @file tc3.h
 *
 * @defgroup tc3 TC3
 *
 * @brief This file contains the API prototypes for the TC3 driver.
 *
 * @version TC3 Driver Version 1.0.0
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
  
#ifndef TC3_H
#define TC3_H

#include "../system/utils/compiler.h"
#include <stdint.h>
#include <stdbool.h>

/**
 * @ingroup tc3
 * @brief Initializes the TC3 module
 * @param None.
 * @return 0 - The TC3 initialization was successful.
 * @return 1 - The TC3 initialization was not successful.
 */
int8_t TC3_Initialize(void);

/**
 * @ingroup tc3
 * @brief Checks the Overflow Interrupt flag status of the TC3 module
 * @param None.
 * @return True  - Overflow interrupt was detected
 * @return False - No overflow interrupt was detected
 */
bool TC3_Get_Overflow_InterruptFlagStatus(void);

/**
 * @ingroup tc3
 * @brief Checks the Compare A flag status of the TC3 module
 * @param None.
 * @return True  - The counter value matches the Output Compare Register A.
 * @return False - The counter value not matches the Output Compare Register A.
 */
bool TC3_Get_CompareA_InterruptFlagStatus(void);

/**
 * @ingroup tc3
 * @brief Checks the Compare B flag status of the TC3 module
 * @param None.
 * @return True  - The counter value matches the Output Compare Register B.
 * @return False - The counter value not matches the Output Compare Register B.
 */

bool TC3_Get_CompareB_InterruptFlagStatus(void);

/**
 * @ingroup tc3
 * @brief Enables the Overflow interrupt of the TC3 module
 * @param None.
 * @return None.
 */
void TC3_Enable_Overflow_Interrupt(void);

/**
 * @ingroup tc3
 * @brief Disables the Overflow interrupt of the TC3 module
 * @param None.
 * @return None.
 */
void TC3_Disable_Overflow_Interrupt(void);

/**
 * @ingroup tc3
 * @brief Enables the Compare A interrupt of the TC3 module
 * @param None.
 * @return None.
 */
void TC3_Enable_CompareA_Interrupt(void);

/**
 * @ingroup tc3
 * @brief Disables the Compare A interrupt of the TC3 module
 * @param None.
 * @return None.
 */
void TC3_Disable_CompareA_Interrupt(void);

/**
 * @ingroup tc3
 * @brief Enables the Compare B interrupt of the TC3 module
 * @param None.
 * @return None.
 */
void TC3_Enable_CompareB_Interrupt(void);

/**
 * @ingroup tc3
 * @brief Disables the Compare B interrupt of the TC3 module
 * @param None.
 * @return None.
 */
void TC3_Disable_CompareB_Interrupt(void);

/**
 * @ingroup tc3
 * @brief Writes the timer value of the TC3 module
 * @param uint16_t - TimerValue
 * @return None.
 */
void TC3_WriteTimer(uint16_t timerValue);

/**
 * @ingroup tc3
 * @brief Reads the timer value of the TC3 module
 * @param None.
 * @return uint16_t - Timer register value
 */
uint16_t TC3_ReadTimer(void);

#endif    //TC3_H
