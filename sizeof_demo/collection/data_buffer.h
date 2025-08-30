#ifndef _DATA_BUFFER_H_
#define _DATA_BUFFER_H_

#include <stdint.h>
#include <stdbool.h>

#define ARRAY_SIZE    16

struct dbuf_st
{
    uint16_t array[ARRAY_SIZE];  //size: 2 * 16 bytes
    uint8_t array_idx;  //size: 1 * 1 byte
};

typedef struct dbuf_st dbuf_t;


void dbuf_init(dbuf_t* obj);
void dbuf_addItem(dbuf_t* obj, uint16_t item);
uint32_t dbuf_computeTotal(dbuf_t* obj);
float dbuf_computeAverage(dbuf_t* obj);

#endif