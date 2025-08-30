#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "ring_buffer/ring_buffer.h"
#include "utilities/util_numeric.h"

void test_ringbuf_init(void)
{
    /*
    Test description:
    - verify array is initialized to 0
    - internal index is initialized to 0
     */
	ringbuf_st target;

	//[action]
	ringbuf_init(&target, ARRAY_SIZE);

	//[assert]
    assert(ARRAY_SIZE == target.buf_size);
    assert(0 == target.buf_idx);  //expect 0
}

void test_ringbuf_addItem(void)
{
    /*
    Test description:
    - verify adding 1 item to the ring buffer
    - verify internal index incremented
     */
	ringbuf_st target;

	//[arrange]
	ringbuf_init(&target, ARRAY_SIZE);

	//[action]
	ringbuf_addItem(&target, 3);

	//[assert]
    assert(3 == target.buf[0]);  //expected data: 3
    assert(1 == target.buf_idx); //expected index: 1
}

void test_ringbuf_compute_total_1(void)
{
    /*
    Test description:
    - verify the sum of 2 items
    - verify the internal index after adding 2 items to the ring buffer
     */
	ringbuf_st target;

	//[arrange]
	ringbuf_init(&target, ARRAY_SIZE);

	//[action]
	ringbuf_addItem(&target, 3);
    ringbuf_addItem(&target, 4);

	//[assert]
    assert(7 == ringbuf_computeTotal(&target));  //expected value: 3
    assert(2 == target.buf_idx);  //expected index: 2
}

void test_ringbuf_compute_total_2(void)
{
    /*
    Test description:
    - verify filling up of the ring buffer
    - verify the sum of the filled ring buffer
    - verify the internal index wrapped back to 0
     */
	ringbuf_st target;
    uint16_t actual;

	//[arrange]
	ringbuf_init(&target, ARRAY_SIZE);

	//[action]
    for(int i = 0; i < ARRAY_SIZE; i++)
    {
        ringbuf_addItem(&target, i);
    }

	//[assert]
    assert(120 == ringbuf_computeTotal(&target));  //expected value: 120
    assert(0 == target.buf_idx);  //expected index wrapped around back to 0
}

void test_ringbuf_compute_average_1(void)
{
    /*
    Test description:
    - verify a fully filled ring buffer
    - verify the sum of the fully filled ring buffer
     */

	ringbuf_st target;
    uint16_t actual;

	//[arrange]
	ringbuf_init(&target, ARRAY_SIZE);

	//[action]
    for(int i = 0; i < ARRAY_SIZE; i++)
    {
        ringbuf_addItem(&target, i);
    }

	//[assert]
    assert(7.5 == ringbuf_computeAverage(&target));  //expected: 7.5
    assert(0 == target.buf_idx);  //expected index wrapped around back to 0
}

void test_ringbuf_compute_average_2(void)
{
    /*
    Test description:
    - verify a fully filled ring buffer
    - verify adding item to a filled ring buffer
    - verify internal index
     */

	ringbuf_st target;
    uint16_t actual;

	//[arrange]
	ringbuf_init(&target, ARRAY_SIZE);

	//[action]
    for(int i = 0; i < ARRAY_SIZE; i++)
    {
        ringbuf_addItem(&target, i);
    }

    ringbuf_addItem(&target, 16);

	//[assert]
    assert(136 == ringbuf_computeTotal(&target));  //expected: 136
    assert(8.5 == ringbuf_computeAverage(&target));  //expected: 8.5
    assert(1 == target.buf_idx);  //expected index wrapped around back to 0
}

void test_ringbuf_compute_average_3(void)
{
	ringbuf_st target;
    uint16_t actual;

    /*
    Test description:
    - verify partially filled up of the ring buffer
    - verify the sum of the partially filled ring buffer
     */

	//[arrange]
	ringbuf_init(&target, ARRAY_SIZE);

	//[action]
	ringbuf_addItem(&target, 3);
    ringbuf_addItem(&target, 4);

	//[assert]
    assert(3.5 == ringbuf_computeAverage(&target));  //expected: 3.5
    assert(2 == target.buf_idx);  //expected index wrapped around back to 0
}

void test_numeric_range_1(void)
{
    const uint16_t MAX_VALUE = 100;
    const uint16_t MIN_VALUE = 50;

    //[arrange]
    uint16_t test_input = 60;

    //[assert]
    assert(true == Numeric_isInRange(test_input, MIN_VALUE, MAX_VALUE));
}

void test_numeric_range_2(void)
{
    const uint16_t MAX_VALUE = 100;
    const uint16_t MIN_VALUE = 50;

    //[arrange]
    uint16_t test_input = 100;

    //[assert]
    assert(false == Numeric_isInRange(test_input, MIN_VALUE, MAX_VALUE));
}

int main(void)
{
	printf("Program started\n");

	test_ringbuf_init();
	test_ringbuf_addItem();
    test_ringbuf_compute_total_1();
    test_ringbuf_compute_total_2();
    test_ringbuf_compute_average_1();
    test_ringbuf_compute_average_2();
    test_ringbuf_compute_average_3();

    test_numeric_range_1();
    test_numeric_range_2();

	printf("Program ended\n");
	return EXIT_SUCCESS;
}

