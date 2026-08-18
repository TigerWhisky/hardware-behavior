; ============================================================
; stack_operations.s
; Demonstração de operações de stack (push / pop)
; e uso do frame pointer (RBP)
; ============================================================

section .data
    msg db "Valor recuperado da stack: ", 0
    ; (sem impressão para manter o exemplo mínimo)

section .text
    global _start

_start:
    ; --------------------------------------------------------
    ; Inuicio de função
    ; --------------------------------------------------------
    push rbp                 ; guardar o RBP antigo
    mov  rbp, rsp            ; novo frame pointer

    ; --------------------------------------------------------
    ; Stack de alguns valores
    ; --------------------------------------------------------
    mov  rax, 100
    push rax                 ; push 100

    mov  rax, 200
    push rax                 ; push 200

    mov  rax, 300
    push rax                 ; push 300

    ; Neste momento a stack tem (cima para baixo):
    ; 300, 200, 100, RBP antigo, ...

    ; --------------------------------------------------------
    ; Desempilhar
    ; --------------------------------------------------------
    pop  rbx                 ; RBX = 300
    pop  rcx                 ; RCX = 200
    pop  rdx                 ; RDX = 100

    ; --------------------------------------------------------
    ; Epílogo
    ; --------------------------------------------------------
    mov  rsp, rbp            ; restaurar RSP
    pop  rbp                 ; restaurar RBP antigo

    ; --------------------------------------------------------
    ; Sair (codgo de saida = valor que estava no topo)
    ; --------------------------------------------------------
    mov  rdi, rbx            ; 300
    mov  rax, 60
    syscall
