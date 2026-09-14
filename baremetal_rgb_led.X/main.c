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
#include <pin_manager.h>
#include <config/board.h>

#include <rgb_led.h>
#include <counter.h>

#define MIN_BRIGHTNESS    0x6800
#define MAX_BRIGHTNESS    0x9C3E

/*
 * Type definitions
 */
typedef enum
{
    eLed_red = 0,
    eLed_green = 1,
    eLed_blue = 2,
}LedColor_enum;

/*
 * local variables
 */
static RgbLed_st led_instance;
static struct counter_st _rgb_led[3];
static volatile uint32_t _sys_tick = 0;

/*
 * local functions
 */
static inline uint32_t get_sysTick(void)
{
    uint32_t tick;
    bool intState = IEC0bits.T2IE;  // Save the current interrupt state
    IEC0bits.T2IE = 0;  // Disable Timer2 interrupt temporarily
    tick = _sys_tick;  // Read the current system tick
    IEC0bits.T2IE = intState;  // Restore the previous interrupt state
    return tick;  // Return the captured system tick
}

//blocking wait function utilizing hardware timer
static void delay_ms(uint32_t ms)
{
    uint32_t start_time = get_sysTick();
    while ((get_sysTick() - start_time) < ms)
    {
        // wait for the delay period to elapse
    }
}

/* ==================================================================
 *  MAIN function
 * ================================================================== */
int main(void)
{
    // Initialize MCU
    SYSTEM_Initialize();
    
    //Set PWM for each channel (red, green, blue) to the dimmest
    OC1_Stop();
    OC1_PrimaryValueSet(MAX_BRIGHTNESS);  //OC1 connected to red LED
    OC1_Start();

    OC2_Stop();
    OC2_PrimaryValueSet(MAX_BRIGHTNESS);  //OC2 connected to green LED
    OC2_Start();

    OC3_Stop();
    OC3_PrimaryValueSet(MAX_BRIGHTNESS);  //OC3 connected to blue
    OC3_Start();

    //initialize counter
    counter_init(&_rgb_led[eLed_red]);
    counter_init(&_rgb_led[eLed_green]);
    counter_init(&_rgb_led[eLed_blue]);
    
    //further customize the behavior
    _rgb_led[eLed_blue].bottom = MIN_BRIGHTNESS;  //highest perceivable brightness
    _rgb_led[eLed_blue].top = MAX_BRIGHTNESS;
    _rgb_led[eLed_blue].step_size = 30;
    _rgb_led[eLed_blue].mode = COUNTER_MODE_DUAL_SLOPE;
    
    //===========================================
    //Task entrance
    //===========================================
    while(1)
    {
        delay_ms(4);

        //color fading action
        //blue
        {
            counter_run(&_rgb_led[eLed_blue]);
            OC3_PrimaryValueSet(_rgb_led[eLed_blue].current_count);  //blue
        }
        //green
        {

        }
        //red
        {
        }
    }
}

/*
 * TMR1 callback
 */
void TMR1_CallBack(void)
{
    _sys_tick++;
}

/**
 End of File
*/

