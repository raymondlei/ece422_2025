#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "collection/data_buffer.h"
#include "collection/util_numeric.h"

void Test_sizeof_struct(void)
{
	dbuf_t target;

	printf("size of struct: %d\n", sizeof(dbuf_t));
    printf("size of struct: %d\n", sizeof(struct dbuf_st));
    printf("size of struct: %d\n", sizeof(target));
}

void Test_sizeof_struct_ptr(void)
{
    dbuf_t target;
    dbuf_t* ptr_target = &target;

    //expected result: 64-bit
	printf("size of struct pointer: %d\n", sizeof(struct dbuf_st*));
    printf("size of struct pointer: %d\n", sizeof(&target));
    printf("size of struct pointer: %d\n", sizeof(ptr_target));
}


int main(void)
{
	printf("Program started\n");

    Test_sizeof_struct();
    Test_sizeof_struct_ptr();

	printf("Program ended\n");
	return EXIT_SUCCESS;
}

