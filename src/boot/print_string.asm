print_string:       ; expects string adress in bx
    push bx
    push ax

    loop_through_string:
        mov al, [bx]    ; find if the current character
        cmp al, 0       ; is not '\0'
        je end_loop_through_string ; jump if it is not the case
        mov ah, 0x0e    ; sets the right flag for interupt
        int 0x10
        add bx, 1       ; increment counter
        jmp loop_through_string

    end_loop_through_string:
        pop ax
        pop bx
        ret
