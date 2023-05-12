%include "../include/io.mac"
section .data

section .text
    extern printf
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    mov edx, 0
    push eax
    shl eax, 3
    add eax, ebx
    ; PRINTF32 `%u\n\x0`, eax
tabla:
    ; PRINTF32 `%u\t\x0`, edx
    ; PRINTF32 `%u\n\x0`, eax
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
skip_dreapta:
    cmp ebx, 0
    jz skip_up
    mov [ecx + edx + 7], byte 1;right_up_corner
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