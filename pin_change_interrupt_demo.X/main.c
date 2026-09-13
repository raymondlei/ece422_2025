/**
  Generated main.c file from MPLAB Code Configurator

  @Company
    Microchip Technology Inc.

  @File Name
    main.c

  @Summary
    This is the generated main.c using PIC24 / dsPIC33 / PIC32MM MCUs.

  @Description
    This source file provides main entry point for system initialization and application code development.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.171.5
        Device            :  PIC24FJ256GA702
    The generated drivers are tested against the following:
        Compiler          :  XC16 v2.10
        MPLAB 	          :  MPLAB X v6.05
*/

/*
    (c) 2020 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

/**
  Section: Included Files
*/
#include <stdint.h>
#include <stdbool.h>

#include <system.h>
#include <tmr2.h>

#include <config/board.h>

/*
                         Main application
 */
static volatile uint32_t _sys_tick = 0;

static inline uint32_t get_sysTick(void)
{
    uint32_t tick;
    bool intState = IEC0bits.T2IE;  // Save the current interrupt state
    IEC0bits.T2IE = 0;  // Disable Timer2 interrupt temporarily
    tick = _sys_tick;  // Read the current system tick
    IEC0bits.T2IE = intState;  // Restore the previous interrupt state
    return tick;  // Return the captured system tick
}

void delay_ms(uint32_t ms)
{
    uint32_t start_time = get_sysTick();
    while ((get_sysTick() - start_time) < ms)
    {
        // wait for the delay period to elapse
    }
}

int main(void)
{
    // initialize the device
    SYSTEM_Initialize();
    
    // Start Timer2 to increment the system tick
    TMR2_Start();

    IO_SET(LED_1);
    IO_SET(LED_2);
    IO_SET(LED_3);
    
    while (1)
    {
        // Add your application code
        delay_ms(1000);  //blocking wait
        UART1_Write('.');
    }

    return 1;
}

void IO_RB5_CallBack(void)
{
    //TODO: explain why multiple 'a' got printed when
    //      there is only a single press of button
//    UART1_Write('a');
    
    //TODO: explain why the toggling is not reliable
    IO_TOGGLE(LED_3);
}

void TMR2_CallBack(void)
{
    _sys_tick++;
}
/**
 End of File
*/

