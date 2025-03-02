.model small
.stack 100h
.data
    prompt1 db 'User 1, input a digit: $'
    prompt2 db 'User 2, guess a digit: $'
    msg_high db 'Too big!$'
    msg_low db 'Too small!$'
    msg_win db 'Game over, User 2 wins!$'
    linefeed db 13, 10, '$'
    secret_num db ?  

.code
begin:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, prompt1
    int 21h

    mov ah, 08h  
    int 21h
    sub al, '0'  
    mov secret_num, al

    mov ah, 09h  
    lea dx, linefeed
    int 21h

try_guess:
    mov ah, 09h
    lea dx, prompt2
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'  

    push ax     
    mov ah, 09h
    lea dx, linefeed
    int 21h
    pop ax

    cmp al, secret_num
    je winner
    jb too_small

too_big:
    mov ah, 09h
    lea dx, msg_high
    int 21h
    jmp continue

too_small:
    mov ah, 09h
    lea dx, msg_low
    int 21h
    jmp continue

winner:
    mov ah, 09h
    lea dx, msg_win
    int 21h
    jmp exit_game

continue:
    mov ah, 09h
    lea dx, linefeed
    int 21h
    jmp try_guess  

exit_game:
    mov ah, 4Ch
    int 21h  
end begin