/*
TODO: add description
*/

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>


#include "StringBuilder.h"

struct strBuilder_st
{
	char* pBuf;
	uint16_t size;
	uint16_t headIdx, tailIdx;
	uint16_t itemCount;
};

void StrBuilder_init(StrBuilder_t obj, char* buf, uint16_t buf_size)
{

}

StrBuilder_t StrBuilder_create(char* buf, uint16_t buf_size)
{
	StrBuilder_t obj = NULL;

	return obj;
}

void StrBuilder_destroy(StrBuilder_t obj)
{

}

bool StrBuilder_appendChar(StrBuilder_t obj, char c)
{
	return false;
}

bool StrBuilder_appendString(StrBuilder_t obj, char* buf, uint16_t buf_size)
{
	return false;
}

uint16_t StrBuilder_export(StrBuilder_t obj, char* out_buf, uint16_t out_buf_size)
{
	out_buf = NULL;
	return 0;
}

uint16_t StrBuilder_getCurrentSize(StrBuilder_t obj)
{
	return 0;
}
