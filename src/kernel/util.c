#include "util.h"

void memory_copy(char *source, char *dest, int nbytes)
{
    for (int i = 0; i < nbytes; ++i)
    {
        *(dest + i) = *(source + i);
    }
}

void memory_set(u8 *dest, u8 val, u32 len)
{
    u8 *temp = (u8 *)dest;
    for ( ; len != 0; len--) *temp++ = val;
}

void int_to_ascii(int n, char str[])
{
    int index = 0, negative = 0;
    if (n < 0)
    {
        n *= -1;
        negative = 1;
    }

    do
    {
        str[index++] = (n % 10) + '0';
        n /= 10;
    } while (n > 0);

    if (negative == 1) str[index++] = '-';
    str[index] = '\0';

    for(int j = 0; j<index/2; ++j)
    {
        char s = str[j];
        str[j] = str[index-j-1];
        str[index-j-1] = s;
    }
}

void hex_to_ascii(int n, char str[])
{
    const char hex_value[] = "0123456789ABCDEF";
    int index = 0;

    do
    {
        str[index++] = hex_value[(n % 16)];
        n /= 16;
    } while (n > 0);

    str[index] = 'x';
    str[index+1] = '0';
    str[index+2] = '\0';
    index += 2;

    for(int j = 0; j<index/2; ++j)
    {
        char s = str[j];
        str[j] = str[index-j-1];
        str[index-j-1] = s;
    }
}
