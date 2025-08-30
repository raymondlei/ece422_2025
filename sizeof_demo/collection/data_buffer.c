#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "data_buffer.h"


void dbuf_init(dbuf_t* obj)
{
    uint8_t i;

    obj->array_idx = 0;

    for(i = 0; i < ARRAY_SIZE; i++)
    {
        obj->array[i] = 0;
    }
}

void dbuf_addItem(dbuf_t* obj, uint16_t item)
{
    /*
    insert data to array in FIFO manner
    overwrite the oldest data if array is full
    */
   obj->array[obj->array_idx] = item;
   obj->array_idx++;
}

uint32_t dbuf_computeTotal(dbuf_t* obj)
{
    /*
    re-compute the sum of all data in the array
    TODO: need to keep track of number of data added?
    */

   return 0;
}

float dbuf_computeAverage(dbuf_t* obj)
{
    /*
    re-compute the average of all data in the array
    */
   return 0.0;
}
bool dbuf_isFull(void)
{
    return false;
}