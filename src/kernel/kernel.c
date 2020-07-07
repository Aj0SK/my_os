#include "../drivers/screen.h"
#include "util.h"

#include "../cpu/isr.h"
#include "../cpu/idt.h"

void main()
{
    isr_install();

    __asm__ __volatile__("int $2");
    __asm__ __volatile__("int $3");

    /*
    clear_screen();

    for (int i = 0; i < 24; ++i)
    {
        char str[255];
        int_to_ascii(i, str);
        kprint_at(str, 0, i);
        hex_to_ascii(i, str);
        kprint_at(str, 10, i);
    }

    kprint("\nTest of the scrolling 1!\n");
    kprint("Test of the scrolling 2!\n");*/
}
