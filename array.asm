section .data
    Sys_write equ 1
    STDOUT equ 1
    Sys_read equ 0
    STDIN equ 0

    msg dq "Enter Number: "    

    count dq 2
    num dq 4
    num_l dq 0

section .bss
    bArray resq 5


section .text
    global _start

_start:
    mov rax, Sys_write ;output prompt for user to enter numbers
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, 14 ;print out the 14 characters
    syscall

    mov rax, Sys_read ;read user input
    mov rdi, STDIN
    mov rsi, bArray ;place the read digits into the memory locaton pointed at by bArray
    mov rdx, 5 ;read 5 digits
    syscall

    mov al, [num_l]
    mov dl, [num] 
    mov cl, [count] ; save the loop variables to implement a for loop

    jmp switch

switch:
    mov r12b , byte[bArray+dl] ;save the first number to be replaced
    mov r13b, byte[bArray+al] ;save the second number to be replaced
    mov byte[bArray+al], r12b 
    mov byte[bArray+dl], r13b

    dec rdx ;modify loop variables to prevent an infinite loop
    inc rax
    dec rcx
    cmp rcx, 0
    jne switch  ;loop to reverse the array
    
    jmp printno


printno:
    mov rax, Sys_write ;print the reversed array
    mov rdi, STDOUT
    mov rsi, bArray
    mov rdx, 5
    syscall

    jmp success

success:
    mov rax,60 ;exit program successfully
    xor rdi,0
    syscall

