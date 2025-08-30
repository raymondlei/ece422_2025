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
}device_st;  //naming of the data structure, with _st postfix.

/* Initialize DAC device before use
 * Typically done once per MCU reset
 */
void dac_init(void)
{
    //assumed SPI bus is properly initialized
    //initialize DAC chip
    printf("initialize DAC device\n");  //mock output

    //TODO: implement codes to properly initialize the DAC device

}

/* Function to change DAC output voltage
 * Param: 16-bit integer, only 8-bit is used for this DAC device
 */
void dac_write_data(uint16_t* value)
{
    //mock output
    *value += 1;
    printf("%d ", *value);

    //actual: interface SPI bus
}

void adc_init(void)
{
    printf("initialize A/D converter\n");
}

void adc_start_sampling(void)
{

}

void adc_start_conversion(void)
{

}

void adc_read()
{
    //TODO: return raw ADC count, return converted voltage

}

/*
 * Main application's entry point
 */
int main(void)
{
    int iteration = 0;  //keep track of run iteration
    uint16_t step = 6;

    dac_init();  //initialize DAC device
    
    //acts as a for(;;) loop
    while(iteration++ < 10)  //limit execution to 1000 iterations
    {
        //TODO: generate a sawtooth waveform
        dac_write_data(&step);  //call to adjust DAC output voltage
    }
}
