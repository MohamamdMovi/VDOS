[BITS 16]
[ORG 0x7C00]

start:
    call print_welcome
    call main_loop

;-------------------------------
print_welcome:
    mov si, msg_welcome
.print_char:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp .print_char
.done:
    ret

;-------------------------------
main_loop:
    mov di, buffer         ; DI → شروع بافر ورودی
    call print_prompt

.read_char:
    xor ah, ah
    int 0x16               ; خواندن کلید
    cmp al, 13             ; Enter؟
    je .execute
    mov ah, 0x0E
    int 0x10               ; چاپ
    stosb                  ; ذخیره در بافر
    jmp .read_char

.execute:
    mov byte [di], 0       ; پایان رشته
    mov si, buffer

    ; دستور: help
    mov di, cmd_help
    call compare_command
    je show_help

    ; دستور: clear
    mov di, cmd_clear
    call compare_command
    je clear_screen

    ; دستور: vdos
    mov di, cmd_vdos
    call compare_command
    je show_version

    jmp main_loop

;-------------------------------
compare_command:
.next_char:
    lodsb
    cmp al, [di]
    jne .not_equal
    cmp al, 0
    je .equal
    inc di
    jmp .next_char
.not_equal:
    clc
    ret
.equal:
    stc
    ret

;-------------------------------
show_help:
    mov si, msg_help
    call print_welcome
    jmp main_loop

show_version:
    mov si, msg_vdos
    call print_welcome
    jmp main_loop

clear_screen:
    mov ah, 0
    mov al, 3
    int 0x10
    jmp main_loop

print_prompt:
    mov si, msg_prompt
    call print_welcome
    ret

;-------------------------------
buffer     times 32 db 0
cmd_help   db "help", 0
cmd_clear  db "clear", 0
cmd_vdos   db "vdos", 0

msg_welcome db "🟢 VDOS Shell Ready", 13, 10, 0
msg_prompt  db "> ", 0
msg_help    db 13, 10, "Commands: help, clear, vdos", 13, 10, 0
msg_vdos    db 13, 10, "VDOS v0.1 - Real Mode Shell", 13, 10, 0

times 510 - ($ - $$) db 0
dw 0xAA55
