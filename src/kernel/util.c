void memory_copy(char *source, char *dest, int nbytes)
{
    for (int i = 0; i < nbytes; ++i)
    {
        *(dest + i) = *(source + i);
    }
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
