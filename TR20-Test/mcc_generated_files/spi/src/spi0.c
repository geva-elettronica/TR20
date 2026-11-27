/**
 * SPI0 Generated Driver File
 *
 * @file spi0.c
 *
 * @ingroup spi0
 *
 * @brief This file contains the driver code for the SPI0 module.
 *
 * @version SPI0 Driver Version 2.0.0.
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

#include "../spi0.h"
#include "../spi_polling_types.h"

/**
 * @ingroup spi0
 * @struct SPI_INTERFACE SPI0
 * @brief Defines an object for SPI_INTERFACE functions.
 */
const struct SPI_INTERFACE RFID = {
    .Initialize = SPI0_Initialize,
    .Deinitialize = SPI0_Deinitialize,
    .Open = SPI0_Open,
    .Close = SPI0_Close,
    .BufferExchange = SPI0_BufferExchange,
    .BufferWrite = SPI0_BufferWrite,
    .BufferRead = SPI0_BufferRead,
    .ByteExchange = SPI0_ByteExchange,
    .ByteWrite = SPI0_ByteWrite,
    .ByteRead = SPI0_ByteRead,
    .IsRxReady = SPI0_IsRxReady,
    .IsTxReady = SPI0_IsTxReady,
    .RxCompleteCallbackRegister = NULL,
    .TxCompleteCallbackRegister = NULL
};

static const spi_configuration_t spi0_configuration[] = {
    { 0x50, 0x0 },
    { 0x11, 0x0 }
};

void SPI0_Initialize(void)
{
    // Return SPI0 registers to reset state
    SPCR0 = 0U;
    SPSR0 = 0U;
}

void SPI0_Deinitialize(void)
{
    // Return SPI0 registers to reset state
    SPCR0 = 0U;
    SPSR0 = 0U;
}

bool SPI0_Open(uint8_t spiConfigIndex)
{
    bool returnValue = false;
    if (0U == (SPCR0 & (1 << SPE)))
    {
        SPCR0 = spi0_configuration[spiConfigIndex].spcr;
        SPSR0 = spi0_configuration[spiConfigIndex].spsr;

        // Disable SPI0 Interrupt and Enable SPI0 module
        SPCR0 &= (~(1 << SPIE));
        SPCR0 |= (1 << SPE);

        returnValue = true;
    }
    else
    {
        returnValue = false;
    }
    return returnValue;
}

void SPI0_Close(void)
{
    // Disable SPI0 Interrupt and Disable SPI0 module
    SPCR0 &= (~(1 << SPIE));
    SPCR0 &= (~(1 << SPE));
    (void) SPDR0; // Clear SPIF
}

void SPI0_BufferExchange(void *bufferData, size_t bufferSize)
{
    uint8_t* bufferInput = bufferData;
    size_t bufferInputSize = bufferSize;
    while (0U != bufferInputSize)
    {
        SPDR0 = *bufferInput;
        while (0U == (SPSR0 & (1 << SPIF)))
        {
            // Wait for flag to get set
        }
        *bufferInput = SPDR0;
        bufferInput++;
        bufferInputSize--;
    }
}

void SPI0_BufferWrite(void *bufferData, size_t bufferSize)
{
    uint8_t* bufferInput = bufferData;
    uint8_t receivedData;
    size_t bufferInputSize = bufferSize;
    while (0U != bufferInputSize)
    {
        SPDR0 = *bufferInput;
        while (0U == (SPSR0 & (1 << SPIF)))
        {
            // Wait for flag to get set
        }
        receivedData = SPDR0; // Read data in buffer to clear SPIF flag
        (void) receivedData;            // Discard received data
        bufferInput++;
        bufferInputSize--;
    }
}

void SPI0_BufferRead(void *bufferData, size_t bufferSize)
{
    uint8_t* bufferInput = bufferData;
    size_t bufferInputSize = bufferSize;
    while (0U != bufferInputSize)
    {
        SPDR0 = 0x00;
        while (0U == (SPSR0 & (1 << SPIF)))
        {
            // Wait for flag to get set
        }
        *bufferInput = SPDR0;
        bufferInput++;
        bufferInputSize--;
    }
}

uint8_t SPI0_ByteExchange(uint8_t byteData)
{
    SPDR0 = byteData;
    while (0U == (SPSR0 & (1 << SPIF)))
    {
        // Wait for flag to get set
    }
    return SPDR0;
}

void SPI0_ByteWrite(uint8_t byteData)
{
    SPDR0 = byteData;
}

uint8_t SPI0_ByteRead(void)
{
    return SPDR0;
}

bool SPI0_IsRxReady(void)
{
    bool returnValue = false;
    if (0U != (SPCR0 & (1 << SPE)))
    {
        returnValue = ((SPSR0 & (1 << SPIF)) != 0) ? true : false;
    }
    else
    {
        returnValue = false;
    }
    return returnValue;
}

bool SPI0_IsTxReady(void)
{
    bool returnValue = false;
    if (0U != (SPCR0 & (1 << SPE)))
    {
        returnValue = ((SPSR0 & (1 << SPIF)) != 0) ? false : true;
    }
    else
    {
        returnValue = false;
    }
    return returnValue;
}