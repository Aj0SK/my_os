print_string:       ; expects string adress in bx
    push bx
    push ax

    loop_through_string:
    mov al, [bx]
    mov ah, 0x0e    ; sets the right flag for interupt
    int 0x10
    add bx, 1
    mov al, [bx]
    cmp al, 0
    jne loop_through_string

    pop ax
    pop bx
    ret
