#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define BUFFER_SIZE 200

int read_value(char *buffer)
{
    fgets(buffer, BUFFER_SIZE, stdin);
    memcpy(buffer + strcspn(buffer, "\n"), "", 1);

    return atoi(buffer);
}

int main(int argc, char const *argv[])
{
    int incrementations = 0;
    char *buffer = malloc(BUFFER_SIZE);

    int current = read_value(buffer);
    int next;

    while (!feof(stdin))
    {
        next = read_value(buffer);
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
