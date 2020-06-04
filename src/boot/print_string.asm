print_string:       ; expects string adress in bx
    push bx
    push ax

    loop_through_string:
    mov al, [bx]
    mov ah, 0x0e    ; sets the right flag for interupt
    int 0x10
    add bx, 1       ; increment counter
    mov al, [bx]    ; find if the current character
    cmp al, 0       ; is not '\0'
    jne loop_through_string ; jump if it is not the case

    pop ax
    pop bx
    ret
