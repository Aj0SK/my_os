print_string:       ; expects string adress in bx
    push bx
    push ax

    print_string_loop:
        mov al, [bx]    ; find if the current character
        cmp al, 0       ; is not '\0'
        je print_string_done ; jump if it is not the case
        mov ah, 0x0e    ; sets the right flag for interupt
        int 0x10
        add bx, 1       ; increment counter
        jmp print_string_loop

    print_string_done:
        pop ax
        pop bx
        ret
