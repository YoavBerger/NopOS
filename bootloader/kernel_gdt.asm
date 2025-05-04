start_null_desc:
    dq 0x0 ;reserved as default for errors

code_segment_desc:
    dw 0xFFFF
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b
    db 0x0

data_segment_desc:
    dw 0xFFFF
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gtd_descriptor_struct:
    dw 24d ;size in bytes
    dd start_null_desc ;offset to start location

CODE_GDT_OFFSET equ 0x8
DATA_GDT_OFFSET equ 0x10