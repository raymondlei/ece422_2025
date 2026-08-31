#include <stdint.h>

#include "xc.h"

#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"

#include <pin_manager.h>
#include <system.h>

#include "board.h"
#include <uart1.h>

#define taskPRIORITY        2
#define taskSTACK_SIZE      256

/*****************************************************************************

    Private functions prototype

*****************************************************************************/
static void vAppTask( void *pvParameters );

/*****************************************************************************

    FreeRTOS Task implementation

*****************************************************************************/
static inline void vCreatNewTasks(unsigned portBASE_TYPE uxPriority)
{
    xTaskCreate(vAppTask,
            (char const*)"uart",
            (uint16_t)taskSTACK_SIZE/(uint16_t)(2),
            NULL,
            uxPriority,
            (TaskHandle_t *) NULL );
}

/*****************************************************************************

    Public functions implementation.

*****************************************************************************/
void taskSerial_init(void)
{
    vCreatNewTasks(taskPRIORITY);
}

static void vAppTask( void *pvParameters )
{
    /* Just to stop compiler warnings. */
    (void) pvParameters;
    uint8_t rx_char;

    //===========================================
    //Task entrance
    //===========================================
    while(1)
    {
        vTaskDelay(50);
        IO_TOGGLE(LED_3);
        
        if(UART1_IsRxReady())
        {
            rx_char = UART1_Read();
            if(UART1_IsTxReady())
                UART1_Write(rx_char);
        }
    }
}
