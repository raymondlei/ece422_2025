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
void taskSerial_init(void)
{
    vCreatNewTasks(taskPRIORITY);
}

static void vAppTask( void *pvParameters )
{
    /* Just to stop compiler warnings. */
    (void) pvParameters;
    uint8_t rx_char;
    uint8_t buf[3];
    uint8_t buf_idx = 0;
    uint8_t value;
    
    printf("UART demo\n\r");
    
    //===========================================
    //Task entrance
    //===========================================
    while(1)
    {
        vTaskDelay(50);
//        IO_TOGGLE(LED_1);  //blinking LED indicates task loop is running
        
        if(UART1_IsRxReady())  //wait for incoming char
        {
            rx_char = UART1_Read();
            
            if(rx_char == 0x0D)
            {
                buf[buf_idx] = '\0';  //zero terminated
                buf_idx = 0;  //reset index
                
                if(_check_input(&buf[0]))
                {
                    value = _convertHex(&buf[0], 2);  //pass array by reference
                    printf("%d\r\n", value);
                }
            }
            else
            {
                if(buf_idx < 2)
                {
                    buf[buf_idx] = rx_char;
                    buf_idx++;
                    
                    _putchar(rx_char);  //echoing
                }
            }
        }
    }
}

static void _putchar(const char ch)
{
    while(UART1_IsTxReady() == false) { }  //'while TX is busy'
    
    UART1_Write(ch);
}

static uint8_t _hexToByte(char ch)
{
    switch(ch)
    {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            return ch - '0';
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
            return ch - 'a' + 10;
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
            return ch - 'A' + 10;
        default: return 0;
    }
}

static bool _check_input(uint8_t* in_str)
{
    bool input_valid = false;
    _putchar('\r');
    _putchar('\n');

    //"if input string is invalid"
    if((in_str[0] != '0') &&
        _hexToByte(in_str[0]) == 0)
    {
        printf("Error: invalid input\r\n");
    }
    else
    {
        printf("0x%s\r\n", &in_str[0]);
        input_valid = true;
    }

    return input_valid;
}

static uint8_t _convertHex(uint8_t* in_str, uint8_t buf_size)
{
    /*
     * TODO: implement hex conversion
     * return 8-bit integer
     */
    uint8_t result = 0;
    
    result = _hexToByte(in_str[0]) * 16;
    result += _hexToByte(in_str[1]);
    
    //return 120; //use constant for testing
    return result;  
}
