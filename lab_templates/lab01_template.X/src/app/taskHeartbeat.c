#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"
#include <croutine.h>

#include <pin_manager.h>
#include <system.h>

#include "board.h"


/* Only one co-routine is created so the index is not significant. */
#define crfFLASH_INDEX    (0)

/*****************************************************************************

    Private functions prototype

*****************************************************************************/
static void prvMainCoRoutine(CoRoutineHandle_t xHandle, unsigned portBASE_TYPE uxIndex);
static void taskHeartbeat_Execute(void);


/*****************************************************************************

    Public functions implementation.

*****************************************************************************/
void taskHeartbeat_Init( unsigned portBASE_TYPE uxPriority )
{
    xCoRoutineCreate( prvMainCoRoutine, uxPriority, crfFLASH_INDEX );
}


/*****************************************************************************

    FreeRTOS Task implementation

*****************************************************************************/
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
       IO_TOGGLE(LED_3);
    }
    portEXIT_CRITICAL();
}
