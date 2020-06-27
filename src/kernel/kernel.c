#include "../drivers/screen.h"

void main() {
    clear_screen();
    kprint_at("T", 0, 0);
    kprint_at(":", 1, 0);
    kprint("There is a line\nbreak");
}
