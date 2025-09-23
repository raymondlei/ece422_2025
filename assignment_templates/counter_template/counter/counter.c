#include "counter.h"

/*
 * Initialize data structure to default values
 */
void counter_init(Counter_t obj)
{
    //TODO: initialize data structure
}

/*
 * Increment counter up to the _top_ value
 */
void counter_inc(Counter_t obj)
{
    /* TODO:
     * 1. increment _current_count by _step_size
     * 2. if the incremented value exceeds _top_, then reset _current_count to 0
     */
}

/*
 * Decrement counter towards zero and then wrap around to the _top_ value
 */
void counter_dec(Counter_t obj)
{
    /* TODO:
     * 1. decrement _current_count by the _step_size
     * 2. if the decremented value is 0, then reset the _current_count to _top.
     *    _current_count is unsigned integer, avoid overflowing the value if step_size is > 1,
     *    (e.g. 1 - 2 => 0xFFFF)
     */
}

/*
 * Increment counter towards the _top_ and then decrement counter towards zero and repeat
 */
void counter_dual_slope(Counter_t obj)
{
    //TODO: implementation
}

void counter_run(Counter_t obj)
{
    /* TODO:
     * 1. if counter mode is eMode_up, then call counter_inc()
     * 2. if counter mode is eMode_down, then call counter_dec()
     * 3. if counter mode is eMode_up_down, then call counter_dual_slope()  //TODO: to-be implemented
     */
}
