#!/usr/bin/env python3
"""
Simulador simples do ciclo Fetch → Decode → Execute

Demonstração, passo a passo, como um processador
básico executa instruções.
"""

class SimpleCPU:
    def __init__(self):
        self.registers = {
            "PC": 0,      # Program Counter
            "R0": 0,
            "R1": 0,
            "R2": 0,
            "R3": 0,
        }
        self.memory = [0] * 64
        self.running = True
        self.cycle = 0

        # Programa sample na memória:
        # LOAD  R0, 10
        # LOAD  R1, 32
        # ADD   R0, R1
        # STORE 20, R0
        # HALT
        self.memory[0:13] = [
            0x01, 0, 10,     # LOAD R0, #10
            0x01, 1, 32,     # LOAD R1, #32
            0x02, 0, 1,      # ADD  R0, R1
            0x03, 20, 0,     # STORE 20, R0
            0xFF             # HALT
        ]

    def fetch(self):
        """Fase Fetch: procura a instrução apontada pelo PC"""
        opcode = self.memory[self.registers["PC"]]
        self.registers["PC"] += 1
        return opcode

    def decode_and_execute(self, opcode):
        """Fase Decode + Execute"""
        if opcode == 0x01:  # LOAD Rn, immediate
            reg = self.memory[self.registers["PC"]]
            self.registers["PC"] += 1
            value = self.memory[self.registers["PC"]]
            self.registers["PC"] += 1
            self.registers[f"R{reg}"] = value
            print(f"  → LOAD  R{reg}, #{value}")

        elif opcode == 0x02:  # ADD Rn, Rm
            rn = self.memory[self.registers["PC"]]
            self.registers["PC"] += 1
            rm = self.memory[self.registers["PC"]]
            self.registers["PC"] += 1
            self.registers[f"R{rn}"] += self.registers[f"R{rm}"]
            print(f"  → ADD   R{rn}, R{rm}  ⇒ R{rn} = {self.registers[f'R{rn}']}")

        elif opcode == 0x03:  # STORE address, Rn
            addr = self.memory[self.registers["PC"]]
            self.registers["PC"] += 1
            rn = self.memory[self.registers["PC"]]
            self.registers["PC"] += 1
            self.memory[addr] = self.registers[f"R{rn}"]
            print(f"  → STORE mem[{addr}] = R{rn} ({self.registers[f'R{rn}']})")

        elif opcode == 0xFF:  # HALT
            self.running = False
            print("  → HALT")

        else:
            print(f"  → Opcode desconhecido: 0x{opcode:02X}")
            self.running = False

    def run(self):
        print("=" * 50)
        print("  Simulador do Ciclo de Instrução")
        print("=" * 50)

        while self.running:
            self.cycle += 1
            print(f"\nCiclo {self.cycle:02d} | PC = {self.registers['PC']}")
            print("-" * 30)

            # FETCH
            opcode = self.fetch()
            print(f"Fetch:  opcode = 0x{opcode:02X}")

            # DECODE + EXECUTE
            self.decode_and_execute(opcode)

        print("\n" + "=" * 50)
        print("Estado final registos:")
        for reg, val in self.registers.items():
            print(f"  {reg:3} = {val}")

        print("\nMemória (posições 0-25):")
        print(" ", self.memory[:26])
        print("=" * 50)


if __name__ == "__main__":
    cpu = SimpleCPU()
    cpu.run()
