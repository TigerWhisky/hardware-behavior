# Registos

Os **registos** são as localizações de armazenamento mais rápidas do processador. Estão na CPU e o acesso é extremamente rápido (1 ciclo ou menos).

## Registos de uso geral (x86-64)

| Registo | Nome completo          | Uso típico                          |
|---------|------------------------|-------------------------------------|
| RAX     | Accumulator            | Retorno de funções, operações aritméticas |
| RBX     | Base                   | Ponteiro base (callee-saved)        |
| RCX     | Counter                | Contador de loops, 4º argumento     |
| RDX     | Data                   | 3º argumento, extensão de multiplicação |
| RSI     | Source Index           | 2º argumento, fonte em operações de string |
| RDI     | Destination Index      | 1º argumento, destino em operações de string |
| RBP     | Base Pointer           | Frame pointer (callee-saved)        |
| RSP     | Stack Pointer          | Topo da stack                       |
| R8–R15  | Registos adicionais    | Argumentos 5–6 e variáveis temporárias |

## Registos especiais

- **RIP** (Instruction Pointer) → Program Counter
- **RFLAGS** → Flags de estado (ZF, CF, SF, OF, PF...)
- **Segment registers** (CS, DS, SS, ES, FS, GS)

## Convenção de chamada (System V AMD64 ABI)

- Argumentos: RDI, RSI, RDX, RCX, R8, R9
- Valor de retorno: RAX (e RDX se for 128 bits)
- Callee-saved: RBX, RBP, R12–R15
- Caller-saved: RAX, RCX, RDX, RSI, RDI, R8–R11

## Exemplo prático

No ficheiro `examples/01_registers/registers.s` podemos ver operações diretas sobre vários registos.
