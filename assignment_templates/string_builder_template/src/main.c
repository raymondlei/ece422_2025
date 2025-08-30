/*
 ============================================================================
 Name        : main.c
 Author      :
 Version     :
 Copyright   : Your copyright notice
 Description : Demonstrate string builder
 ============================================================================
*/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "StringBuilder.h"

/*
 Assignment:
 1. Implement a string builder that supports appending characters and strings.
 2. Implement a function to export the built string.
 3. Build unit tests
*/

int main(void)
{
    char buf[20];
    char export_str[20];
    StrBuilder_t target;

    // [Initialize]
    target = StrBuilder_create(&buf[0], 20);
    StrBuilder_appendChar(target, '1');
    StrBuilder_appendString(target, "23", 2);
    StrBuilder_export(target, &export_str[0], 20);

    if(export_str != NULL)
        printf("%s\n", export_str);  //expected output: "123"

	return EXIT_SUCCESS;
}
