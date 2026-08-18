; ============================================================
; registers.s
; Demonstração de manipulação de registos em x86-64
; ============================================================

section .data
    ; não é preciso para este exeplo simples

section .text
    global _start

_start:
    ; --------------------------------------------------------
    ; 1. Inicialização de registos
    ; --------------------------------------------------------
    mov rax, 10              ; RAX = 10
    mov rbx, 25              ; RBX = 25
    mov rcx, 3               ; RCX = 3
    mov rdx, 7               ; RDX = 7

    ; --------------------------------------------------------
    ; 2. Operações aritméticas
    ; --------------------------------------------------------
    add rax, rbx             ; RAX = 10 + 25 = 35
    imul rax, rcx            ; RAX = 35 * 3  = 105
    sub rax, rdx             ; RAX = 105 - 7 = 98

    ; --------------------------------------------------------
    ; 3. Transferência entre registos
    ; --------------------------------------------------------
    mov rsi, rax             ; RSI = RAX (98)
    mov rdi, rbx             ; RDI = RBX (25)

    ; --------------------------------------------------------
    ; 4. Operações lógicas
    ; --------------------------------------------------------
    xor rdx, rdx             ; RDX = 0 (forma rápida de zerar)
    or  rsi, 1               ; RSI = RSI | 1
    and rdi, 0xFF            ; RDI = RDI & 0xFF

    ; --------------------------------------------------------
    ; 5. Sair do programa
    ;    O valor de RAX será o código de saída (echo $?)
    ; --------------------------------------------------------
    mov rdi, rax             ; código de saída = valor final de RAX
    mov rax, 60              ; syscall: exit
    syscall
