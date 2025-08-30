#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include "ring_buffer.h"


void ringbuf_init(ringbuf_st* obj, uint16_t array_size)
{
    //TODO: initialize array to 0
}

void ringbuf_addItem(ringbuf_st* obj, uint16_t item)
{
    //TODO: add item to the array, keep track of the item being added
}

uint32_t ringbuf_computeTotal(ringbuf_st* obj)
{
    //TODO: compute the total of all data in the array
    return 0;
}

float ringbuf_computeAverage(ringbuf_st* obj)
{
    //TODO: compute the average value of items in the array
    return 0.0F;
}

bool ringbuf_isFull(ringbuf_st* obj)
{
    //TODO: determine if the ring buffer is full.
    return false;
}