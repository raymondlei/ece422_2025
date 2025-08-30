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
#include <taskHeartbeat.h>

#include <taskBlinky.h>
#include <taskSerial.h>

/* The number of flash co-routines to create. */
#define mainNUM_FLASH_COROUTINES   (1)

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
    
    //=========================================================================
    //    Application Task initialization
    //=========================================================================
    
    //TODO: add description about the function of the task
    taskHeartbeat_Init(mainNUM_FLASH_COROUTINES);
    
    //TODO: add description about the function of the task
//    taskBlinky_init();
    
    //TODO: add description about the function of the task
    taskSerial_init();
    
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
