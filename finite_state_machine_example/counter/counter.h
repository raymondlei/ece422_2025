#ifndef COUNTER_H
#define COUNTER_H

#include <stdbool.h>
#include <stdint.h>

typedef enum
{
	COUNTER_MODE_UP,
	COUNTER_MODE_DOWN,
	COUNTER_MODE_DUAL_SLOPE
} CounterMode;

struct counter_st
{
	uint16_t prescaler;
	uint16_t prescaler_count;
	uint16_t bottom;
	uint16_t top;
	uint16_t match;
	CounterMode mode;
	uint16_t step_size;
	uint16_t current_count;
	bool counting_up;
	bool match_flag;
};

typedef struct counter_st* Counter_t;


void counter_init(Counter_t obj);
void counter_inc(Counter_t obj);
void counter_dec(Counter_t obj);
void counter_dual_slope(Counter_t obj);
void counter_run(Counter_t obj);
void counter_match_clear(Counter_t obj);

#endif

