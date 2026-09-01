/*
 * Name:
 * Student ID:
 */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <assert.h>

#include <ring_buffer/ring_buffer.h>

static void test_additional_ring_buffer_behavior(void)
{
	RingBuffer buffer;

	ring_buffer_init(&buffer);

	/* TODO: Replace this smoke check and add at least four meaningful cases. */
	assert(ring_buffer_is_empty(&buffer));
}

int main(void)
{
	test_additional_ring_buffer_behavior();
	return 0;
}