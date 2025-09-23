#ifndef SOFT_PWM_H
#define SOFT_PWM_H

#include "counter.h"

struct soft_pwm_st
{
    struct counter_st counter;
    float duty_cycle;  //in percentage (0 to 100)
    bool output_state; //true = HIGH, false = LOW
};

typedef struct soft_pwm_st* SoftPwm_t;

void softPwm_init(SoftPwm_t obj, uint16_t ticks_per_second);
void softPwm_setDutyCycle(SoftPwm_t obj, float duty_cycle);
void softPwm_run(SoftPwm_t obj);
bool softPwm_getOutputState(SoftPwm_t obj);

#endif // SOFT_PWM_H