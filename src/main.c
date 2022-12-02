#include <stdio.h>
#include <stdlib.h>

#include "main.h"

int main()
{
    printf("Chess engine %d.%d.%d-%s.\n", VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH, GIT_HASH);
    return 0;
}
