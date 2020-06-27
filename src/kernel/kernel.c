#include "../drivers/screen.h"
#include "util.h"

void main() {
    clear_screen();

    /* Fill up the screen */
    for (int i = 0; i < 24; ++i)
    {
        char str[255];
        int_to_ascii(i, str);
        kprint_at(str, 0, i);
        hex_to_ascii(i, str);
        kprint_at(str, 10, i);
    }

    kprint("\nTest of the scrolling 1!\n");
    kprint("Test of the scrolling 2!\n");
}
