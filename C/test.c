#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a, b, c;
    for (c = 1; c <= 10; c++)
    {
        for (b = 1; b <= c; b++)
        {
            for (a = 1; a <= b; a++)
            {
                if (a * a + b * b == c * c)
                    printf("%d %d %d \n", a, b, c);
            }
        }
    }
}