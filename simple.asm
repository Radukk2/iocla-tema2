%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    mov ebx, 0
loop1:
    movzx eax, byte[esi + ebx]
    add eax, edx
    ; PRINTF32 `%u\n\x0`, eax
    cmp eax, 90
    jng jump
salt:
    sub eax, 26
    jmp jump
jump:
    mov [edi + ebx], eax
    inc ebx
    dec ecx
    jnz loop1
    ; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
