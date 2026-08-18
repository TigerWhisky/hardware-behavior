# Ciclo de Instrução

O processador executa programas através de um ciclo contínuo chamado **ciclo de instrução**.

## As 3 fases principais

### 1. Fetch (Busca)
- O **Program Counter (PC / RIP)** contém o endereço da próxima instrução.
- A instrução é lida da memória e colocada no registo de instrução (IR).
- O PC é incrementado para apontar para a próxima instrução.

### 2. Decode (Descodificação)
- A Unidade de Controlo analisa o opcode da instrução.
- Identifica quais registos e operandos serão usados.
- Determina que unidade funcional (ALU, FPU, etc.) será necessária.

### 3. Execute (Execução)
- A operação é realmente realizada (soma, carga de memória, salto, etc.).
- Os resultados são escritos nos registos ou na memória.
- Flags de estado (ZF, CF, SF, OF...) podem ser atualizadas.

## Exemplo simplificado
PC → 0x400000
Fetch:  mov rax, 42
Decode: "mover o valor imediato 42 para o registo RAX"
Execute: RAX = 42
PC → 0x400007 (próxima instrução)


## Pipeline

Processadores modernos usam **pipeline**: várias instruções estão em fases diferentes ao mesmo tempo (Fetch de uma, Decode de outra, Execute de outra...).

Isto aumenta o throughput, mas introduz complexidade (hazards, stalls, branch prediction).

## No simulador deste repositório

O ficheiro `examples/03_instruction_cycle/simple_cpu_sim.py` representa um processador extremamente simples que executa o ciclo Fetch → Decode → Executar passo a passo para ver o processo.
