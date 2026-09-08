#include "FreeRTOS.h"
#include "croutine.h"
#include "task.h"

#include <pin_manager.h>
#include "board.h"

/* Only one co-routine is created so the index is not significant. */
#define crfFLASH_INDEX             (0)

/* The number of flash co-routines to create. */
#define mainNUM_FLASH_COROUTINES   (1)

static void taskHeartbeat_Execute(void);
static void prvMainCoRoutine(CoRoutineHandle_t xHandle, unsigned portBASE_TYPE uxIndex);


void taskHeartbeat_Init( unsigned portBASE_TYPE uxPriority )
{
    xCoRoutineCreate( prvMainCoRoutine, uxPriority, crfFLASH_INDEX );
}

static void prvMainCoRoutine(CoRoutineHandle_t xHandle, unsigned portBASE_TYPE uxIndex)
{
    /* Co-routines MUST start with a call to crSTART. */
    crSTART(xHandle);

    for (;;)
    {
        crDELAY(xHandle, pdMS_TO_TICKS(1000));

        taskHeartbeat_Execute();
    }

    /* Co-routines MUST end with a call to crEND. */
    crEND();
}

/*
    Process the heartbeat. This is done in the main event loop (as
    opposed to an interrupt) so we can see if the App has locked up.
*/
static void taskHeartbeat_Execute(void)
{
    portENTER_CRITICAL();
    {
        IO_TOGGLE(LED_2);
    }
    portEXIT_CRITICAL();
}
