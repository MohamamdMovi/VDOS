[BITS 16]
[ORG 0x7C00]
start:
    mov ah, 0x0E
    mov si, message
.print:
    lodsb
    or al, al
    jz .input
    int 0x10
    jmp .print    

.input:
    mov ah, 0x00
    int 0x16           ; خواندن کلید از کیبورد
    mov ah, 0x0E
    int 0x10           ; چاپ کاراکتر تایپ شده
    jmp .input

message db 0xB1, " Welcome to VDOS Shell", 13, 10, "Type anything:", 13, 10, 0

times 510 - ($ - $$) db 0
dw 0xAA55