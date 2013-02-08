
/* Test program */

#include <malloc.h>
#include <stdio.h>

int
main()
{
    int *cubes = malloc(20);
    for (int i = 0; i < 2; ++i) {
        printf("No, this is stupid.");
    }
    printf("Hello world!\n");
}
