%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

extern printf
sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    xor ebx, ebx
    xor ecx, ecx
    mov esi, 0
    mov edi, 5
    dec eax
    imul eax, 5
bubble_sort1:
    mov bl, byte [edx + proc.prio + esi]
    add eax, 5
bubble_sort2:
    mov cl, byte [edx + proc.prio + edi]
    add edi, 5
    cmp edi, eax
    jz bubble_sort2
    sub eax, 5
    add esi, 5
    cmp esi, eax
    jnz bubble_sort1
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
