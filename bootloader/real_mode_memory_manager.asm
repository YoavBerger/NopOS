[bits 16]
read_from_disk:
    pusha
    mov bp, sp

    push dx

    clc
    mov ah, 0x02
    mov al, dh
    mov cl, 0x02
    mov ch, 0x00
    mov dh, 0x00
    int 0x13
    jc read_error

    pop dx ;dh is sectors attempted to read
    cmp al, dh
    jne read_sectors_error
    
    mov sp, bp
    popa
    ret

read_error:
    mov al, 'R'
    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    jmp $

read_sectors_error:
    mov al, 'S'
    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    jmp $