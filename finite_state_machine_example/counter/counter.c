#include "counter.h"

static void update_match_flag(Counter_t obj)
{
	if (obj->current_count == obj->match)
	{
		obj->match_flag = true;
	}
}

void counter_init(Counter_t obj)
{
	obj->prescaler = 1u;
	obj->prescaler_count = 0u;
	obj->bottom = 0u;
	obj->top = UINT16_MAX;
	obj->match = 0u;
	obj->mode = COUNTER_MODE_UP;
	obj->step_size = 1u;
	obj->current_count = obj->bottom;
	obj->counting_up = true;
	obj->match_flag = false;
}

void counter_inc(Counter_t obj)
{
	if ((obj->current_count > obj->top) ||
		(obj->step_size > (uint16_t)(obj->top - obj->current_count)))
	{
		obj->current_count = 0u;
	}
	else
	{
		obj->current_count = (uint16_t)(obj->current_count + obj->step_size);
	}

	update_match_flag(obj);
}

void counter_dec(Counter_t obj)
{
	if (obj->current_count > obj->top)
	{
		obj->current_count = obj->top;
	}
	else if (obj->step_size > obj->current_count)
	{
		obj->current_count = obj->top;
	}
	else
	{
		obj->current_count = (uint16_t)(obj->current_count - obj->step_size);
	}

	update_match_flag(obj);
}

void counter_dual_slope(Counter_t obj)
{
	if (obj->current_count > obj->top)
	{
		obj->current_count = obj->top;
		obj->counting_up = false;
	}
	else if (obj->current_count < obj->bottom)
	{
		obj->current_count = obj->bottom;
		obj->counting_up = true;
	}
	else if (obj->counting_up)
	{
		if (obj->step_size >= (uint16_t)(obj->top - obj->current_count))
		{
			obj->current_count = obj->top;
			obj->counting_up = false;
		}
		else
		{
			obj->current_count = (uint16_t)(obj->current_count + obj->step_size);
		}
	}
	else if (obj->step_size >= (uint16_t)(obj->current_count - obj->bottom))
	{
		obj->current_count = obj->bottom;
		obj->counting_up = true;
	}
	else
	{
		obj->current_count = (uint16_t)(obj->current_count - obj->step_size);
	}

	update_match_flag(obj);
}

void counter_run(Counter_t obj)
{
	uint16_t divisor = obj->prescaler;

	if (divisor == 0u)
	{
		divisor = 1u;
	}

	obj->prescaler_count++;
	if (obj->prescaler_count < divisor)
	{
		return;
	}
	obj->prescaler_count = 0u;

	switch (obj->mode)
	{
		case COUNTER_MODE_UP:
			counter_inc(obj);
			break;

		case COUNTER_MODE_DOWN:
			counter_dec(obj);
			break;

		case COUNTER_MODE_DUAL_SLOPE:
			counter_dual_slope(obj);
			break;

		default:
			break;
	}
}

void counter_match_clear(Counter_t obj)
{
	obj->match_flag = false;
}
