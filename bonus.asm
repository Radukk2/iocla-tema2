section .data
    
section .text
    global bonus

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
    mov edx, 0 ; indicele din matrice
    push eax
    shl eax, 3
    add eax, ebx
    xor esi, esi
    xor edi, edi
    mov edx, eax
    pop eax
    cmp eax, 7
    jz skip_up
    cmp ebx, 7
    jz skip_dreapta
    cmp eax, 3
    jl j2
    push eax
    add eax, 1
    sub eax, 4
    imul eax, 8
    add eax, ebx
    inc eax
    mov esi, 1
inmultire1:
    shl esi, 1
    dec eax
    cmp eax, 0
    jnz inmultire1
    pop eax
    add [ecx], esi
    jmp skip_dreapta
j2:
    push eax
    add eax, 1
    imul eax, 8
    add eax, ebx
    inc eax
    mov edi, 1
inmultire2:
    shl edi, 1
    dec eax
    cmp eax, 0
    jnz inmultire2
    pop eax
    add ecx, 4
    add [ecx], edi
    sub ecx, 4
skip_dreapta:
    cmp ebx, 0
    jz skip_up
    cmp eax, 3
    jl j3
    push eax
    add eax, 1
    sub eax, 4
    imul eax, 8
    add eax, ebx
    dec eax
    push ebx
    mov ebx, 1
inmultire3:
    shl ebx, 1
    dec eax
    cmp eax, 0
    jnz inmultire3
    add [ecx], ebx
    pop ebx
    pop eax
    jmp skip_up
j3:
    push eax
    add eax, 1
    imul eax, 8
    add eax, ebx
    dec eax
    push ebx
    mov ebx, 1
inmultire4:
    shl ebx, 1
    dec eax
    cmp eax, 0
    jnz inmultire4
    add ecx, 4
    add [ecx], ebx
    sub ecx, 4
    pop ebx
    pop eax
skip_up:
    cmp eax, 0
    jz skip_down
    cmp ebx, 0
    jz skip_left
    cmp eax, 5
    jl j4
    push eax
    sub eax, 5
    imul eax, 8
    add eax, ebx
    dec eax
    push ebx
    mov ebx, 1
inmultire5:
    shl ebx, 1
    dec eax
    cmp eax, 0
    jnz inmultire5
    add [ecx], ebx
    pop ebx
    pop eax
    jmp skip_left
j4:
    push eax
    sub eax, 1
    imul eax, 8
    add eax, ebx
    dec eax
    push ebx
    mov ebx, 1
inmultire6:
    shl ebx, 1
    dec eax
    cmp eax, 0
    jnz inmultire6
    add ecx, 4
    add [ecx], ebx
    sub ecx, 4
    pop ebx
    pop eax
skip_left:
    cmp ebx, 7
    jz skip_down 
    cmp eax, 5
    jl j5
    push eax
    sub eax, 5
    imul eax, 8
    add eax, ebx
    inc eax
    push ebx
    mov ebx, 1
inmultire7:
    shl ebx, 1
    dec eax
    cmp eax, 0
    jnz inmultire7
    add [ecx], ebx
    pop ebx
    pop eax
    jmp skip_down
j5:
    push eax
    sub eax, 1
    imul eax, 8
    add eax, ebx
    inc eax
    push ebx
    mov ebx, 1
inmultire8:
    shl ebx, 1
    dec eax
    cmp eax, 0
    jnz inmultire8
    add ecx, 4
    add [ecx], ebx
    sub ecx, 4
    pop ebx
    pop eax
skip_down:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY