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
    }

    //kprint_at("Test of the scrolling 1!", 60, 24);
    kprint("Test of the scrolling 1!\n");
    kprint("Test of the scrolling 2!\n");
}
