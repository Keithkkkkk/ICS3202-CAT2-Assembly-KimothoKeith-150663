section .data
    Sys_write equ 1
    STDOUT equ 1
    Sys_read equ 0
    STDIN equ 0

    msg dq "Enter Number: "  

    num dq 0  

section .bss
    bArray resq 1

section .text
    global _start

_start:
    mov rax, Sys_write ;Prompt user to enter a number
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, 14
    syscall

    mov rax, Sys_read ; Read the number entered by the user
    mov rdi, STDIN
    mov rsi, bArray
    mov rdx, 1 ;This only takes a single digit
    syscall

    sub qword[rsi], 48 ;converts the number entered from ascii to decimal by subtracting 48
    mov r13, [rsi] ;moves the number to the r13 register 
    mov rax, 1 ;places 1 to the accumulator to facilitate multiplication

    call calculate ; calls the calculate subroutine
                   ; pushes the content of rip onto the stack
    
    jmp success ;jumps to the exit program if normal flow resumes

calculate:    
    push qword[rsi] ;pushes the contents of RSI onto the stack
    dec qword[rsi]
    cmp qword[rsi],0

    jne calculate ; loops until the number reaches zero meaning all necessary numbers have been placed onto the stack

    jmp popper ; jumps to the popper where multiplication will take place

popper:
    pop r12 ; pops the stack contents onto r12
    mul r12 ; multiplies the content of r12 with the accumulator
    cmp r12,  r13 ;comparison to check if the last digit has been popped

    jne popper ; loops to pop all pushed digits 
    
    ret ;pops the content of the stack onto rip to return to normal program flow

success:
    mov rax,60
    xor rdi,0
    syscall

