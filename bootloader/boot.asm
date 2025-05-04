[bits 16]
[org 0x7c00]

KERNEL_OFFSET equ 0x1000
KERNEL_SECTORS equ 2

mov bp, 0x9000
mov sp, bp
mov [BOOT_DRIVE_LOCATION], dl

load_kernel_memory:
    mov dl, [BOOT_DRIVE_LOCATION]
    mov dh, KERNEL_SECTORS
    mov ax, 0x0000
    mov es, ax
    mov bx, KERNEL_OFFSET
    call read_from_disk
    jmp load_kernel_gdt

load_kernel_gdt:
    cli
    lgdt [gtd_descriptor_struct]
    mov eax, cr0
    bts eax, 0
    mov cr0, eax

    jmp CODE_GDT_OFFSET:init_32bit_segments

[bits 32]
init_32bit_segments:
    mov ax, DATA_GDT_OFFSET
    mov ds, ax  
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0xA0000 ;setting up stack at away from critical resources 
    mov esp, ebp
    jmp start_kernel

start_kernel:   
    call KERNEL_OFFSET
    jmp $

%include "real_mode_memory_manager.asm"
%include "kernel_gdt.asm"

BOOT_DRIVE_LOCATION db 0
times 510 - ($-$$) db 0 ;padding to fill in the MBR so BIOS will recognize magic number
dw 0xaa55
