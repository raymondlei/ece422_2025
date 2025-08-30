/**
 * Summary: DAC driver code to generate sawtooth waveform
 * Author: Raymond Lei
 * Date: 2023-08-30
 * 
 * Revision log:
 * v1 - basic function call structure
 * v2 - added mock output
 * 
 */


/*
 * Keywords to search online:
 * "C passed by reference", "C passed by value", "C data structure"
 * "C pass data structure as reference"
 */



//C Preprocessor Directives
#include <stdint.h>  //for definition of 8-bit, 16-bit, 32-bit integer data type
#include <stdio.h>   //for printf

//C Preprocessor Directives
#define VERSION    2  //Code revision, see revision log 


//Define a structure
typedef struct
{
    uint8_t id;         //8-bit integer, for identifying which DAC device to interface
    uint8_t voltage;    //8-bit integer, expected voltage, converted from DAC count
    uint16_t dac_count;  //16-bit integer, for tracking current DAC value
}dac_st;  //naming of the data structure, with _st postfix.

dac_st dac_LED_brightness_front;  //declaring an instance of a data structure, (global scope)
dac_st dac_LED_brightness_back;  //declaring an instance of a data structure, (global scope)

/* Initialize DAC device before use
 * Typically done once per MCU reset
 */
void dac_init(dac_st* obj, uint16_t init_step)
{
    obj->dac_count = init_step;
    //assumed SPI bus is properly initialized
    //initialize DAC chip
    printf("initialize DAC device\n");  //mock output

    //TODO: implement codes to properly initialize the DAC device
}

/* Function to change DAC output voltage
 * Param: reference pointer of dac_inst
 */
void dac_write_data(dac_st* obj)
{
    //increment step by 1 and output to DAC
    if(obj->dac_count + 1 > 255)  //in 16-bit number, 255 + 1 = 256, //in 8-bit: 255 + 1 = 0
        obj->dac_count = 0;
    else
        obj->dac_count += 1;

    //mock output
    //reference the data field within the data structure
    printf("%d ", obj->dac_count);

    //actual: interface SPI bus    
}

/*
 * Main application's entry point
 */
int main(void)
{
    int iteration = 0;  //keep track of run iteration

    //dac_inst.dac_count = 0;
    dac_init(&dac_LED_brightness_front, 255);  //initialize DAC device
    dac_init(&dac_LED_brightness_back, 128);  //initialize DAC device
    
    while(iteration++ < 260)  //limit execution to 1000 iterations
    {
        /*
         * generate a sawtooth waveform:
         * signal pattern: 0, 1, 2, 3, .... , 255 -> 0, 1, 2, 3, 4, ... 
         */
        //for 16-bit unsigned integer: 0, 1, 2, .... 65535, 0, 1, 2, 
        //65536 => 0x10000
        //65535 => 0xFFFF
        //for 8-bit unsigned integer: 0, 1, 2, .... 255, 0

        //call to adjust DAC output voltage
        dac_write_data(&dac_LED_brightness_front);  //passing in the data struct as reference
        dac_write_data(&dac_LED_brightness_back);  //passing in the data struct as reference
    }
}
