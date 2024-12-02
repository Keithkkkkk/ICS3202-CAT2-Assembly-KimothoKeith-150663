section .data
    Sys_write equ 1
    STDOUT equ 1
    Sys_read equ 0
    STDIN equ 0

    msg dq "Enter Number: "
    zer dq "Number is zero"
    pos dq "Number is positive"
    negatv dq "Number is negative"

section .bss
    bArray resb 2

section .text
    global _start

_start:
    mov rax, Sys_write ;output prompt to enter numbers
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, 14
    syscall

    mov rax, Sys_read ; read user inputs
    mov rdi, STDIN
    mov rsi, bArray
    mov rdx, 2 ;read only the first 2 characters 
    syscall

    jmp determine

determine:
    ;this program only checks the first value entered to determine its sign

    cmp byte[bArray],48 ;determines if the number entered is a zero as this is the ascii code for 0
    je zero    

    cmp byte[bArray],45 ;determines if the first value entered is the negative sign as this is the ascii code for the negative sign
    je negative
    
    jmp positive ;if none of the above conditions have been satisfied, this means the number entered is positive

zero:
    mov rax, Sys_write ; print a message that the number entered is a zero
    mov rdi, STDOUT
    mov rsi, zer
    mov rdx, 14
    syscall

    jmp success

negative:
    mov rax, Sys_write ; print a message that the number entered is a negative
    mov rdi, STDOUT
    mov rsi, negatv
    mov rdx, 18
    syscall

    jmp success

positive:
    mov rax, Sys_write ; print a message that the number enterede is a positive
    mov rdi, STDOUT
    mov rsi, pos
    mov rdx, 18
    syscall

    jmp success

success:
    mov rax,60
    xor rdi,0
    syscall
