#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int read_value(char *buffer, int buffer_size)
{
    fgets(buffer, buffer_size, stdin);
    memcpy(buffer + strcspn(buffer, "\n"), "", 1);

    return atoi(buffer);
}

int main(int argc, char const *argv[])
{
    int incrementations = 0;
    int buffer_size = 200;
    char *buffer = malloc(buffer_size);

    int current = read_value(buffer, buffer_size);
    int next;

    while (!feof(stdin))
    {
        next = read_value(buffer, buffer_size);
        if (next > current)
        {
            incrementations += 1;
        }
        current = next;
    }

    printf("measurement increased %d times\n", incrementations);

    free(buffer);

    return 0;
}
