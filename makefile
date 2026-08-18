ASM = nasm
ASMFLAGS = -f elf64
LD = ld
CC = gcc
CFLAGS = -no-pie -fno-stack-protector

.PHONY: all clean

all: \
	examples/01_registers/registers \
	examples/01_registers/registers_c \
	examples/02_memory/memory_access \
	examples/02_memory/memory_access_c \
	examples/04_stack/stack_operations

# === 01_registers ===
examples/01_registers/registers: examples/01_registers/registers.o
	$(LD) $< -o $@

examples/01_registers/registers.o: examples/01_registers/registers.s
	$(ASM) $(ASMFLAGS) $< -o $@

examples/01_registers/registers_c: examples/01_registers/registers.c
	$(CC) $(CFLAGS) $< -o $@

# === 02_memory ===
examples/02_memory/memory_access: examples/02_memory/memory_access.o
	$(LD) $< -o $@

examples/02_memory/memory_access.o: examples/02_memory/memory_access.s
	$(ASM) $(ASMFLAGS) $< -o $@

examples/02_memory/memory_access_c: examples/02_memory/memory_access.c
	$(CC) $(CFLAGS) $< -o $@

# === 04_stack ===
examples/04_stack/stack_operations: examples/04_stack/stack_operations.o
	$(LD) $< -o $@

examples/04_stack/stack_operations.o: examples/04_stack/stack_operations.s
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm -f examples/*/*.o \
	      examples/01_registers/registers \
	      examples/01_registers/registers_c \
	      examples/02_memory/memory_access \
	      examples/02_memory/memory_access_c \
	      examples/04_stack/stack_operations
