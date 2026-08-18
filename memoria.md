# Manipulação de Memória

A memória é organizada linearmente (modelo flat memory do x86-64). O CPU acede-lhe por meio de endereços.

## Tipos de acesso

### Load (leitura)

mov rax, [endereço]      ; carrega 8 bytes da memória para RAX
mov eax, [endereço]      ; carrega 4 bytes
mov ax,  [endereço]      ; carrega 2 bytes
mov al,  [endereço]      ; carrega 1 byte

### Store (escrita)

mov [endereço], rax

### Modos de endereçamento comuns

Direto
[variavel]
Endereço absoluto

Registo indireto
[rax]
Endereço contido em RAX

Base + deslocamento
[rbp-8]
Variável local

Indexado
[array + rcx*8]
array[rcx]

Base + índice + desloc.
[rbx + rcx*4 + 16]
Estruturas complexas

Secções de memória

.data → dados inicializados
.bss  → dados não inicializados (mais eficiente)
.text → código (instruções)
Stack   → cresce para baixo (endereços decrescentes)
Heap    → gerida pelo programador / malloc

Alinhamento
Acessos desalinhados são mais lentos (e em algumas arquiteturas proibidos). Sempre que possível, dados de 8 bytes devem estar alinhados a 8 bytes.

Exemplo
Vê examples/02_memory/ para exemplos concretos de load/store e acesso a arrays.

