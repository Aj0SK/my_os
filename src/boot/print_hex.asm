HEX_OUT:
    db "0x0000", 0
HEX_HELPER:
    db "0123456789abcdef", 0
    
print_hex:
    push cx
    push bx
    push ax
    
    mov bx, HEX_HELPER ; extracts first byte into cx
    mov cx, dx
    and cx, 0x000f
    add bx, cx          ; add cx into index in HEX_HELPER
    mov al, [bx]        ; move character from HEX_HELPER into al
    mov [HEX_OUT+5], al ; write character from al into output string
    
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
