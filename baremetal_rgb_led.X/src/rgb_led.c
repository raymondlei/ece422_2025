#include <stdint.h>

#include <oc1.h>
#include <oc2.h>
#include <oc3.h>
#include "rgb_led.h"

static uint32_t timerPeriod = 9999; // 400 Hz period in clock ticks
static uint16_t redDutyCycle;
static uint16_t greenDutyCycle;
static uint16_t blueDutyCycle;


void rgb_led_init(RgbLed_st* context)
{
    /* Initialize LED to off */
    rgb_led_set_color(context, 100, 100, 100);
    context->state = 1; // RGB LED is ON next
}

void rgb_led_off(RgbLed_st* context)
{
    /* Drive all PWM 100% (assuming common anode LED)  */
    
    // Disable the output capture pins
    OC1_Stop();
    OC2_Stop();
    OC3_Stop();
    
    // Set the output capture duty cycles
    OC1_PrimaryValueSet(timerPeriod);
    OC2_PrimaryValueSet(timerPeriod);
    OC3_PrimaryValueSet(timerPeriod);
    
    // Enable the output capture pins
    OC1_Start();
    OC2_Start();
    OC3_Start();
}

void rgb_led_on(RgbLed_st* context)
{
    /* "Restore to previous color"
     * Restore PWM according to the context's RGB duty-cycle value
     * (for example: it was set to orange color, restore the LED to orange color)
     */
    
    // Disable the output capture pins
    OC1_Stop();
    OC2_Stop();
    OC3_Stop();
    
    // Calculate the RGB duty cycle
    redDutyCycle = context->red * timerPeriod / 100;
    greenDutyCycle = context->green * timerPeriod / 100;
    blueDutyCycle = context->blue * timerPeriod / 100;
    
    // Set the output capture duty cycles
    OC1_PrimaryValueSet(redDutyCycle);
    OC2_PrimaryValueSet(greenDutyCycle);
    OC3_PrimaryValueSet(blueDutyCycle);
    
    // Enable the output capture pins
    OC1_Start();
    OC2_Start();
    OC3_Start();
}

void rgb_led_toggle(RgbLed_st* context)
{
    /* "Toggle between on/off state"
     * If it's on, restore PWM according to the context's RGB duty-cycle value
     * If it's off, drive all PWM 100% (assuming common anode LED)
     */
    
    if (context->state == 1)         // Set RGB to color 1
    {
        rgb_led_set_color(context, 0, 55, 91);
        context->state = 2;
    }
    else if (context->state % 2 == 0) // Turn RGB OFF
    {
        rgb_led_off(context);
                
        if (context->state == 6)
        {
            context->state = 1;
        }
        else
        {
            context->state++;
        }
    }
    else if (context->state == 3)    // Set RGB to color 2
    {
        rgb_led_set_color(context, 75, 12, 18);
        context->state = 4;
    }
    else if (context->state == 5)    // Set RGB to color 3
    {
        rgb_led_set_color(context, 7, 49, 7);
        context->state = 6;
    }
}

void rgb_led_set_color(RgbLed_st* context, uint8_t red, uint8_t green, uint8_t blue)
{
    /* "Set specific PWM duty-cycle value for each color"
     * For common anode LED:
     * - 100% duty-cycle means LED off
     * - 0% duty-cycle means full brightness
     */
    
    context->red = red;
    context->green = green;
    context->blue = blue;
    
    rgb_led_on(context);
}
