section .data
    low dq 50 ;different level settings
    medium dq 100
    high dq 150

    status db 0,0

section .bss

section .text
    global _start

_start:
    mov rbx, qword[low] ;changing this value should producing varying results to the bits in status
    cmp rbx, 100 ;determines if condition is low, medium or high

    je stop ;

    jb engage

    ja alarm

stop:
    AND byte[status], 0 ;keeps the first bit at 0 or changes it to 0 if it was 1 by performing an and operation in 
                        ;uses the memory location pointed at by the status variable
    jmp success    

engage:
    OR byte[status], 1 ;keeps the first bit at 1 or changes it to 1 if it was 0 by performing an or operation
                       ;uses the memory location pointed at by the status variable
    jmp success

alarm:
    OR byte[status+1], 1 ;changes the first bit of the the second byte to 1 
                         ;uses the memory location pointed at by the status variable in the first offset
    jmp success

success:
    mov rax,60
    xor rdi,0
    syscall    