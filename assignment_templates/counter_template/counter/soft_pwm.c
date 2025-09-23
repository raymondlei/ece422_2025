#include <stdint.h>
#include <stdbool.h>

#include "soft_pwm.h"

void softPwm_init(SoftPwm_t obj, uint16_t ticks_per_second)
{
    if(obj == NULL || ticks_per_second == 0)
        return;

    //Initialize counter part
    counter_init(&obj->counter);
}

void softPwm_setDutyCycle(SoftPwm_t obj, float duty_cycle)
{
    if(obj == NULL)
        return;

    if(duty_cycle < 0)
        duty_cycle = 0;
    if(duty_cycle > 100)
        duty_cycle = 100;

    obj->duty_cycle = duty_cycle;

    //TODO:
    //1. calculate match value and top value
    //2. set counter mode
}

void softPwm_run(SoftPwm_t obj)
{
    if(obj == NULL)
        return;

    //Run the counter
    counter_run(&obj->counter);
}

bool softPwm_getOutputState(SoftPwm_t obj)
{
    if(obj == NULL)
        return false;
    return obj->output_state;
}