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
    int tmp;
    a = read_value(buffer);
    b = read_value(buffer);
    c = read_value(buffer);

    while (!feof(stdin))
    {
        if ((tmp = read_value(buffer)) == -1)
            break;

        if (b + c + tmp > a + b + c)
            incrementations += 1;

        a = b;
        b = c;
        c = tmp;
    }

    printf("measurement increased %d times\n", incrementations);

    free(buffer);

    return 0;
}
