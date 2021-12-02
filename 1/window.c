#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define BUFFER_SIZE 200

int read_value(char *buffer)
{
    if (!fgets(buffer, BUFFER_SIZE, stdin))
        return -1;

    memcpy(buffer + strcspn(buffer, "\n"), "", 1);

    return atoi(buffer);
}

int main(int argc, char const *argv[])
{
    char *buffer = malloc(BUFFER_SIZE);

    int a, b, c;
    int ax, bx, cx;
    int incrementations = 0;

    a = read_value(buffer);
    b = read_value(buffer);
    c = read_value(buffer);

    while (!feof(stdin))
    {
        ax = b;
        bx = c;
        if ((cx = read_value(buffer)) == -1)
            break;
        if (ax + bx + cx > a + b + c)
            incrementations += 1;

        a = ax;
        b = bx;
        c = cx;
    }

    printf("measurement increased %d times\n", incrementations);

    free(buffer);

    return 0;
}
