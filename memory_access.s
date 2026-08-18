; ============================================================
; memory_access.s
; Demonstração load/store e acesso a arrays
; ============================================================

section .data
    valor1      dq 42
    valor2      dq 0
    array       dq 10, 20, 30, 40, 50, 60, 70, 80
    msg_ok      db "Acesso à memória realizado com sucesso", 10
    msg_ok_len  equ $ - msg_ok

section .bss
    resultado   resq 1

section .text
    global _start

_start:
    ; --------------------------------------------------------
    ; 1. Load de memória → registo
    ; --------------------------------------------------------
    mov rax, [valor1]            ; RAX = 42

    ; --------------------------------------------------------
    ; 2. Store de registo → memória
    ; --------------------------------------------------------
    mov [valor2], rax            ; valor2 = 42

    ; --------------------------------------------------------
    ; 3. Acesso a array (indexado)
    ;    array[3] → 40
    ; --------------------------------------------------------
    mov rbx, 3                   ; índice
    mov rax, [array + rbx*8]     ; RAX = array[3] = 40

    ; --------------------------------------------------------
    ; 4. Guardar resultado
    ; --------------------------------------------------------
    mov [resultado], rax

    ; --------------------------------------------------------
    ; 5. (Opcional) Escrever mensagem
    ; --------------------------------------------------------
    mov rax, 1                   ; syscall write
    mov rdi, 1                   ; stdout
    mov rsi, msg_ok
    mov rdx, msg_ok_len
    syscall

    ; --------------------------------------------------------
    ; 6. Sair
    ; --------------------------------------------------------
    mov rdi, 0
    mov rax, 60
    syscall
