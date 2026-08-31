#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "xc.h"

#include "FreeRTOS.h"
#include "timers.h"
#include "task.h"

#include <pin_manager.h>
#include <system.h>

#include "board.h"
#include <uart1.h>

#define taskPRIORITY        2
#define taskSTACK_SIZE      512

/*****************************************************************************

    Private functions prototype

*****************************************************************************/
static void vAppTask( void *pvParameters );
static void echo_char(const char ch);


/*****************************************************************************

    FreeRTOS Task implementation

*****************************************************************************/
static inline void vCreatNewTasks(unsigned portBASE_TYPE uxPriority)
{
    xTaskCreate(vAppTask, (char const*)"uart",
                (uint16_t)taskSTACK_SIZE/(uint16_t)(2),
                NULL,
                uxPriority,
                (TaskHandle_t *) NULL );
}

static inline void _putchar(const char ch)
{
    while(UART1_IsTxReady() == false) { }  //'while TX is busy'
    
    UART1_Write(ch);
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
    
    printf("UART demo\n\r");
    IO_SET(LED_1);  //turn off LED blue channel
    IO_SET(LED_2);  //turn off LED green channel
    IO_SET(LED_3);  //turn off LED red channel
    
    //===========================================
    //Task entrance
    //===========================================
    while(1)
    {
        vTaskDelay(50);
        //IO_TOGGLE(LED_1);  //blinking LED indicates task loop is running
        
        if(UART1_IsRxReady())  //wait for incoming char
        {
            rx_char = UART1_Read();
            echo_char(rx_char);
        }
    }
}


static void echo_char(const char input_ch)
{
    if(input_ch == 0x0D)
    {
        printf("\r\n");
    }
    else
    {
        _putchar(input_ch);  //echoing
    }
    
}