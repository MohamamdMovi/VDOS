[BITS 16]
[ORG 0x7C00]       ; BIOS loads boot sector here

start:
    mov si, message

print_loop:
    lodsb               ; Load byte from [SI] into AL
    or al, al           ; Check if AL == 0 (end of string)
    jz hang
    mov ah, 0x0E        ; BIOS teletype output
    int 0x10            ; print AL
    jmp print_loop

hang:
    cli                 ; Disable interrupts
    hlt                 ; Halt CPU

message db "🟢 VDOS Booting Successfully!", 0

times 510 - ($ - $$) db 0   ; Fill rest of sector with zeros
dw 0xAA55                   ; Boot signature
