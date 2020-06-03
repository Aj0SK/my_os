HEX_OUT:
    db "0x0000", 0
HEX_HELPER:
    db "0123456789abcdef", 0
    
print_hex:
    push cx
    push bx
    push ax
    
    mov bx, HEX_HELPER
    mov cx, dx
    and cx, 0x000f
    add bx, cx
    mov al, [bx]
    mov [HEX_OUT+5], al
    
    mov bx, HEX_HELPER
    mov cx, dx
    shr cx, 4
    and cx, 0x000f
    add bx, cx
    mov al, [bx]
    mov [HEX_OUT+4], al
    
    mov bx, HEX_HELPER
    mov cx, dx
    shr cx, 8
    and cx, 0x000f
    add bx, cx
    mov al, [bx]
    mov [HEX_OUT+3], al
    
    mov bx, HEX_HELPER
    mov cx, dx
    shr cx, 12
    and cx, 0x000f
    add bx, cx
    mov al, [bx]
    mov [HEX_OUT+2], al
    
    mov bx, HEX_OUT
    call print_string
    
    pop ax
    pop bx
    pop cx
    ret

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
