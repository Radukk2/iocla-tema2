%include "../include/io.mac"

    ;;
struc avg
    .quo resw 1
    .remain resw 1
endstruc
    ;;
struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0
section .text
    global run_procs
    extern printf


run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx], dword 0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor edx, edx
    imul ebx, 5
    xor esi, esi
iterate:
    mov dl, [ecx + proc.prio + esi]
    cmp edx, 1 
    jnz not_1
    add [prio_result], dword 1
    mov dl, [ecx + proc.time + esi]
    add [time_result], edx
not_1:
    cmp edx, 2
    jnz not_2
    add [prio_result + 4], dword 1
    mov dl, [ecx + proc.time + esi]
    add [time_result + 4], edx
not_2:
    cmp edx, 3
    jnz not_3
    add [prio_result + 8], dword 1
    mov dl, [ecx + proc.time + esi]
    add [time_result + 8], edx
not_3:
    cmp edx, 4
    jnz not_4
    add [prio_result + 12], dword 1
    mov dl, [ecx + proc.time + esi]
    add [time_result + 12], edx
not_4:
    cmp edx, 5
    jnz not_5
    add [prio_result + 16], dword 1
    mov dl, [ecx + proc.time + esi]
    add [time_result + 16], edx
not_5:
    add esi, 5
    cmp esi, ebx
    jnz iterate
    xor esi, esi
    xor edi, edi
jump_vector:
    mov esi, [prio_result + edi]
    xor esi, esi
    mov esi, [time_result + edi]
    add edi, 4
    cmp edi, 20
    jnz jump_vector
    xor ecx, ecx
vector:
    push eax
    xor eax, eax
    mov eax, [time_result + ecx * 4]
    mov ebx, [prio_result + ecx * 4]
    cmp ebx, 0
    je jump_zero
    cdq
    idiv  ebx
    mov edi, eax
    pop eax
    mov [eax + avg.quo + 4 * ecx], di
    mov [eax + avg.remain + 4 * ecx], dx
    jmp new_skip
jump_zero:
    pop eax
    mov [eax + avg.quo + 4 * ecx], word 0
    mov [eax + avg.remain + 4 * ecx], word 0
new_skip:
    inc ecx
    cmp ecx, 5
    jnz vector
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY