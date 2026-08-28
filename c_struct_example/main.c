#include <stdio.h>
#include <stdint.h>

//A "struct" bundles related variables (fields) together under one custom type
typedef struct
{
    uint8_t channel_id;         //fixed-width type: guarantees exactly 8 bits, common for HW register/channel IDs
    float voltage_samples[4];   //raw voltage readings captured from the sensor
    float average_voltage;      //computed by _processSensorReading()
    float peak_voltage;         //computed by _processSensorReading()
} SensorReading;

//Passing "SensorReading* reading" (a pointer) lets us modify the caller's struct
//directly, instead of working on a copy - this avoids copying the whole struct
void _processSensorReading(SensorReading* reading)
{
    float sum = 0.0f;
    
    //"->" dereferences the pointer and accesses a field in one step
    //(equivalent to (*reading).peak_voltage)
    reading->peak_voltage = reading->voltage_samples[0];
    for(int i = 0; i < 4; i++)
    {
        sum += reading->voltage_samples[i];
        if(reading->voltage_samples[i] > reading->peak_voltage)
        {
            reading->peak_voltage = reading->voltage_samples[i];
        }
    }
    reading->average_voltage = sum / 4;
}

void _demo_1(void)
{
    //Struct fields can be initialized in order using { } syntax, including a nested
    //array for voltage_samples
    SensorReading collection_1 =
    {
        3,
        {
            2.15f,
            2.48f,
            2.31f,
            2.60f
        },
        0.0f,  // average voltage initialized to 0
        0.0f   // peak voltage initialized to 0
    };

    //"&reading" passes the address of the struct, so the function can modify the
    //original variable rather than an internal copy
    _processSensorReading(&collection_1);

    //"." (dot) is used here since "reading" is a struct variable, not a pointer
    //uint8_t is promoted to int in varargs, so %u still prints it correctly
    printf("channel %u: average voltage = %.2fV, peak voltage = %.2fV\n", collection_1.channel_id, collection_1.average_voltage, collection_1.peak_voltage);
}

void _demo_2(void)
{
    //Alternative: "designated initializers" name each field explicitly, so order
    //doesn't matter and unnamed fields default to 0 - often clearer to read
    SensorReading collection_2 =
    {
        .channel_id = 4,
        .voltage_samples = { 1.98f, 2.05f, 2.12f, 2.20f },
        .average_voltage = 0.0f,
        .peak_voltage = 0.0f
    };
    
    //"&reading" passes the address of the struct, so the function can modify the
    //original variable rather than an internal copy
    _processSensorReading(&collection_2);

    //"." (dot) is used here since "reading" is a struct variable, not a pointer
    printf("channel %u: average voltage = %.2fV, peak voltage = %.2fV\n", collection_2.channel_id, collection_2.average_voltage, collection_2.peak_voltage);
}

int main()
{
    _demo_1();
    // _demo_2();

    return 0;
}