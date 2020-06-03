[org 0x7c00]

mov bx, HELLO_MSG
call print_string

mov bx, GOODBYE_MSG
call print_string

mov dx, 0x1fb6
call print_hex

mov dx, 0xffff
call print_hex

jmp $

%include "src/print_string.asm"
%include "src/print_hex.asm"

HELLO_MSG:
    db "Hello World!", 0

GOODBYE_MSG :
    db "Goodbye!", 0

times 510-($-$$) db 0
dw 0xaa55
