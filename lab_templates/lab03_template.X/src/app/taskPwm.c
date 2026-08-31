
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "xc.h"

#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"

#include <pin_manager.h>
#include <system.h>
#include "oc1.h"
#include "oc2.h"
#include "oc3.h"

#include "board.h"


#define taskPRIORITY        2
#define taskSTACK_SIZE      256

/*****************************************************************************

    Private functions prototype

*****************************************************************************/
static void vAppTask( void *pvParameters );
static void _putchar(const char ch);
static void _printOutput(char* str, uint8_t str_size);
static bool _check_input(uint8_t* in_str);
static uint8_t _hexToByte(char ch);
static uint8_t _convertHex(uint8_t* in_str, uint8_t buf_size);

/*****************************************************************************

    FreeRTOS Task implementation

*****************************************************************************/
static inline void vCreatNewTasks(unsigned portBASE_TYPE uxPriority)
{
    xTaskCreate(vAppTask, (char const*)"uart", (uint16_t)taskSTACK_SIZE/(uint16_t)(2), NULL, uxPriority, (TaskHandle_t *) NULL );
}

/*****************************************************************************

    Public functions implementation.

*****************************************************************************/
void taskPwm_init(void)
{
    vCreatNewTasks(taskPRIORITY);
}

static void vAppTask( void *pvParameters )
{
    /* Just to stop compiler warnings. */
    (void) pvParameters;
    const uint16_t step_size = 4;
    uint16_t iter = 0;
    
    
    OC1_Stop();
    OC1_PrimaryValueSet(0x3E70);  //blue
    OC1_Start();

    OC2_Stop();
    OC2_PrimaryValueSet(0x3E80);  //green
    OC2_Start();

    OC3_Stop();
    OC3_PrimaryValueSet(0x3E80);  //red
    OC3_Start();
    
    IO_TOGGLE(LED_2);  //blinking LED indicates task loop is running
    //===========================================
    //Task entrance
    //===========================================
    while(1)
    {
        vTaskDelay(4);
        //IO_TOGGLE(LED_2);  //blinking LED indicates task loop is running
        OC1_Stop();
        OC1_PrimaryValueSet(iter);  //green
        OC1_Start();
        
        iter += step_size;
        if (iter >= 9000)
            iter = 1000;
    }
}
