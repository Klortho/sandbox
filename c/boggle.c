/* Test program */

#include <malloc.h>
#include <stdio.h>

#include "cubes.h"

int
main()
{
    int *cubes = malloc(20);
    int i;
    for (i = 0; i < 2; ++i) {
        printf("Hey\n");
    }
    printf("Hello world!\n");
}
