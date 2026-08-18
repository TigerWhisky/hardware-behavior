# Hardware Behavior

Demonstração prática do funcionamento ao nível do hardware: ciclos de instrução, registos e manipulação de memória.

## Objetivos

- Compreender o **ciclo de instrução** (Fetch → Decode → Execute)
- Manipular **registos** de uso geral e especiais
- Realizar operações diretas de **leitura/escrita em memória**
- Observar o comportamento real da stack e dos ponteiros

## Estrutura

| Pasta | Conteúdo |
|-------|----------|
| `docs/` | Explicações teóricas detalhadas |
| `examples/01_registers` | Manipulação de registos |
| `examples/02_memory` | Acesso e manipulação de memória |
| `examples/03_instruction_cycle` | Simulador do ciclo de instrução |
| `examples/04_stack` | Operações de stack |

## Requisitos

- `nasm` + `ld` (ou `gcc`) para Assembly x86-64
- `gcc` para os exemplos em C
- Python 3 (apenas para o simulador)

## Como compilar e executar

```bash
# Exemplo Assembly
cd examples/01_registers
nasm -f elf64 registers.s -o registers.o
ld registers.o -o registers
./registers

# Exemplo C
gcc -o registers registers.c
./registers
