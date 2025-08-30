#ifndef _DATA_BUFFER_H_
#define _DATA_BUFFER_H_

#include <stdint.h>
#include <stdbool.h>

#define ARRAY_SIZE    16

typedef struct
{
    uint16_t buf[ARRAY_SIZE];
    uint16_t buf_size;  //size of the array
    uint8_t buf_idx;    //array index
    bool is_filled;     //track if the buffer is filled

}ringbuf_st;

void ringbuf_init(ringbuf_st* obj, uint16_t array_size);
void ringbuf_addItem(ringbuf_st* obj, uint16_t item);
uint32_t ringbuf_computeTotal(ringbuf_st* obj);
float ringbuf_computeAverage(ringbuf_st* obj);

#endif