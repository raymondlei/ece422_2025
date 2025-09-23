/*
 ============================================================================
 Author      : 
 Version     :
 Description : 

 ============================================================================
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "unit_test.h"
#include "soft_pwm.h"

void pwm_application_demo(void)
{
	const uint16_t TICKS_PER_SECOND = 100;
	struct soft_pwm_st pwm_instance;
	bool output_state = false;
	softPwm_init(&pwm_instance, TICKS_PER_SECOND); // 1000 ticks per second
	softPwm_setDutyCycle(&pwm_instance, 25.0f); // 25% duty cycle

	for(uint16_t iter = 0; iter < 1000; iter++) // simulate 5 seconds
	{
		softPwm_run(&pwm_instance);
		if(pwm_instance.output_state == output_state)
		{
			if(pwm_instance.output_state == true)
			{
				printf("^");
			}
			else
			{
				printf("v");
			}
			output_state = pwm_instance.output_state;  // update state
		}
		else if(iter % TICKS_PER_SECOND == 0) // print a separator every second
		{
			printf("|\n");
		}
		else
		{
			printf("_");
		}
	}
}

int main(void)
{
	uint16_t iter = 0;

	//unit tests
	counter_inc_test();
	counter_dec_test();
	counter_dual_slope_test();

	//application
	pwm_application_demo();

	return EXIT_SUCCESS;
}
