
%include "../include/io.mac"
section .data
    
section .text
    global bonus
    extern printf

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    mov edx, 0
    push eax
    shl eax, 3
    add eax, ebx

tabla:
    mov [ecx + edx], byte 0
    inc edx
    cmp edx, 64
    jnz tabla
    mov edx, eax
    pop eax
    cmp eax, 7
    jz skip_up
    cmp ebx, 7
    jz skip_dreapta
    mov [ecx + edx + 9], byte 1;left_up corner
    cmp eax, 3
    jl j2
    push eax
    add eax, 1
    sub eax, 4
    imul eax, 8
    sub eax, ebx
    add eax, 7
    dec eax
    mov esi, 1
inmultire1:
    shl esi, 1
    dec eax
    cmp eax, 0
    jnz inmultire1
    pop eax
    jmp skip_dreapta ;;;
    PRINTF32 `esi:%u\n\x0`, esi
j2:
    push eax
    add eax, 1
    imul eax, 8
    sub eax, ebx
    add eax, 7
    dec eax
    mov edi, 1
inmultire2:
    shl edi, 1
    dec eax
    cmp eax, 0
    jnz inmultire2
    pop eax
    ; PRINTF32 `edi:%u\n\x0`, edi
skip_dreapta:
    cmp ebx, 0
    jz skip_up
    mov [ecx + edx + 7], byte 1;right_up_corner
    cmp eax, 

skip_up:
    cmp eax, 0
    jz skip_down
    cmp ebx, 0
    jz skip_left
    mov [ecx + edx - 9], byte 1;left_down_corner
skip_left:
    cmp ebx, 7
     jz skip_down 
    mov [ecx + edx - 7], byte 1;right_down_corenr
skip_down:
    
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY