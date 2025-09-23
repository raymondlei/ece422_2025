#include <stdint.h>

#include "counter.h"

void counter_inc_test(void)
{
	const uint16_t expected[30] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };
	struct counter_st instance;  //instance of the data structure

	//TODO: write unit test to verify the counter output.
}

void counter_dec_test(void)
{
	const uint16_t expected[30] = { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 10, 9, 8, 7, 6, 5, 4, 3 };
	struct counter_st instance;  //instance of the data structure

	//TODO: write unit test to verify the counter output.
}

void counter_dual_slope_test(void)
{
	const uint16_t expected[30] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
	struct counter_st instance;  //instance of the data structure

	//TODO: write unit test to verify the counter output.
}
