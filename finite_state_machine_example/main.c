/*
 ============================================================================
 Author      : Raymond Lei
 Version     : v1.0
 Description : Demonstrates the finite state machine functionality

 ============================================================================
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "fsm.h"

void fsm_demo(void)
{
	uint16_t iter = 0;

	FsmMain_init();

	while(iter++ < 500)
	{
		switch(iter)
		{
			case 100:
			printf("\n");
			break;
			case 200:
			printf("\n");
			break;
			case 300:
			printf("\n");
			break;
			case 400:
			printf("\n");
			break;
			case 499:
			break;
		}
		FsmMain_run();
	}

	//get pointer to the application model
	app_model_t model = AppModel_get();

	//print one data field
	printf("\nUser score: %u\n", model->score);
}

/*
 ============================================================================
   MAIN entry point
 ============================================================================
 */
int main(void)
{
	fsm_demo();

	return EXIT_SUCCESS;
}
