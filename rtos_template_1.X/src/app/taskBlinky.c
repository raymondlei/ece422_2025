
#include <stdint.h>

#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"

#include <pin_manager.h>
#include <system.h>

#include "board.h"
#define taskPRIORITY        1
#define taskSTACK_SIZE      128

/*****************************************************************************

    Private functions prototype

*****************************************************************************/
static void vAppTask( void *pvParameters );

/*****************************************************************************

    FreeRTOS Task implementation

*****************************************************************************/
static inline void vCreatNewTasks(unsigned portBASE_TYPE uxPriority)
{
    xTaskCreate(vAppTask, (char const*)"blink", (uint16_t)taskSTACK_SIZE/(uint16_t)(2), NULL, uxPriority, (TaskHandle_t *) NULL );
}

/*****************************************************************************

    Public functions implementation.

*****************************************************************************/
void taskBlinky_init(void)
{
    vCreatNewTasks(taskPRIORITY);
}

static void vAppTask( void *pvParameters )
{
    /* Just to stop compiler warnings. */
    (void) pvParameters;

    //turning off active-low LEDs
    IO_SET(LED_1);
    IO_SET(LED_2);
    IO_SET(LED_3);
            
    //===========================================
    //Task entrance
    //===========================================
    while(1)
    {
        vTaskDelay(500);
        IO_TOGGLE(LED_1);
    }
}