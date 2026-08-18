# Hardware Behavior

Demonstração prática do funcionamento ao nível do hardware: **ciclos de instrução**, **registos** e **manipulação de memória**.

Este repositório tem como objetivo mostrar, de forma clara e prática, como o processador executa instruções, como utiliza os registos e como acede à memória.

## Objetivos de Aprendizagem

- Compreender o ciclo **Fetch → Decode → Execute**
- Manipular registos de uso geral e especiais (RAX, RBX, RCX, RDX, RSI, RDI, RSP, RBP, etc.)
- Realizar operações de **load/store** em memória
- Observar o comportamento da **stack**
- Relacionar código de alto nível com o que acontece realmente no hardware

## Estrutura do Repositório

| Pasta / Ficheiro | Conteúdo |
|------------------|----------|
| `docs/` | Explicações teóricas detalhadas |
| `examples/01_registers` | Manipulação de registos |
| `examples/02_memory` | Acesso e manipulação de memória |
| `examples/03_instruction_cycle` | Simulador simples do ciclo de instrução |
| `examples/04_stack` | Operações de stack (push/pop) |
| `Makefile` | Compilação fácil de todos os exemplos |

## Requisitos

- `nasm` e `ld` (ou `gcc`) para Assembly x86-64
- `gcc` para os exemplos em C
- Python 3 (apenas para o simulador)

### Instalação rápida (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install nasm build-essential python3
