/**
  Generated main.c file from MPLAB Code Configurator

  @Company
    Microchip Technology Inc.

  @File Name
    main.c

  @Summary
    This is the generated main.c using PIC24 / dsPIC33 / PIC32MM MCUs.

  @Description
    This source file provides main entry point for system initialization and application code development.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.171.2
        Device            :  PIC24FJ256GA705
    The generated drivers are tested against the following:
        Compiler          :  XC16 v2.10
        MPLAB 	          :  MPLAB X v6.05
*/

/*
    (c) 2020 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

/**
  Section: Included Files
*/
#include <stddef.h>      // Defines NULL
#include <stdbool.h>     // Defines true
#include <stdlib.h>      // Defines EXIT_FAILURE

#include <FreeRTOS.h>
#include <croutine.h>
#include <task.h>

#include <pin_manager.h>
#include <system.h>
#include "FreeRTOSConfig.h"

#include "board.h"
#include <taskBlinky.h>
//#include <taskSerial.h>
#include <taskPwm.h>

/* Only one co-routine is created so the index is not significant. */
#define crfFLASH_INDEX             (0)

/* The number of flash co-routines to create. */
#define mainNUM_FLASH_COROUTINES   (1)

static void taskHeartbeat_Init(unsigned portBASE_TYPE uxPriority);
static void taskHeartbeat_Execute(void);
static void prvMainCoRoutine(CoRoutineHandle_t xHandle, unsigned portBASE_TYPE uxIndex);
/*
                         Main application
 */
int main(void)
{
    // initialize the device
    SYSTEM_Initialize();

    //=========================================================================
    //    Board initialization
    //=========================================================================
    

    //=========================================================================
    //    Set application's initial state
    //=========================================================================
    //IO_TOGGLE(LED_2);  //blinking LED indicates task loop is running
    
    //=========================================================================
    //    Application Task initialization
    //=========================================================================
    taskHeartbeat_Init(mainNUM_FLASH_COROUTINES);
//    taskBlinky_init();
//    taskSerial_init();
    taskPwm_init();
    
    //=========================================================================
    //    FreeRTOS scheduler
    //=========================================================================
    vTaskStartScheduler();

    /* If all is well then this line will never be reached.  If it is reached
    then it is likely that there was insufficient (FreeRTOS) heap memory space
    to create the idle task.  This may have been trapped by the malloc() failed
    hook function, if one is configured.
    */
    
    while (1)
    {
        // Add your application code
    }
    
    return 1;
}
/**
 End of File
*/

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

static void taskHeartbeat_Init( unsigned portBASE_TYPE uxPriority )
{
    xCoRoutineCreate( prvMainCoRoutine, uxPriority, crfFLASH_INDEX );
}

/*
    Process the heartbeat. This is done in the main event loop (as
    opposed to an interrupt) so we can see if the App has locked up.
*/
static void taskHeartbeat_Execute(void)
{
    portENTER_CRITICAL();
    {
//        IO_TOGGLE(LED_2);
    }
    portEXIT_CRITICAL();
}
