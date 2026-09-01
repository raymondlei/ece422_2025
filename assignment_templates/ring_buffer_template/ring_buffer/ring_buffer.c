#include "ring_buffer.h"

void ring_buffer_init(RingBuffer* buffer)
{
	buffer->head = 0u;
	buffer->tail = 0u;
	buffer->count = 0u;
}

RingBufferStatus ring_buffer_enqueue(RingBuffer* buffer, uint8_t value)
{
	if (ring_buffer_is_full(buffer))
	{
		return RING_BUFFER_FULL;
	}

	buffer->data[buffer->head] = value;
	buffer->head = (buffer->head + 1u) % RING_BUFFER_CAPACITY;
	buffer->count++;
	return RING_BUFFER_OK;
}

RingBufferStatus ring_buffer_dequeue(RingBuffer* buffer, uint8_t* value)
{
	if (ring_buffer_is_empty(buffer))
	{
		return RING_BUFFER_EMPTY;
	}

	*value = buffer->data[buffer->tail];
	buffer->tail = (buffer->tail + 1u) % RING_BUFFER_CAPACITY;
	buffer->count--;
	return RING_BUFFER_OK;
}

RingBufferStatus ring_buffer_peek(const RingBuffer* buffer, uint8_t* value)
{
	if (ring_buffer_is_empty(buffer))
	{
		return RING_BUFFER_EMPTY;
	}

	*value = buffer->data[buffer->tail];
	return RING_BUFFER_OK;
}

size_t ring_buffer_size(const RingBuffer* buffer)
{
	return buffer->count;
}

size_t ring_buffer_capacity(void)
{
	return RING_BUFFER_CAPACITY;
}

bool ring_buffer_is_empty(const RingBuffer* buffer)
{
	return buffer->count == 0u;
}

bool ring_buffer_is_full(const RingBuffer* buffer)
{
	return buffer->count == RING_BUFFER_CAPACITY;
}
