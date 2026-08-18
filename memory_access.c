/*
 * memory_access.c
 * Acesso a memória com C + inline assembly
 */

#include <stdio.h>

int main() {
    long valor1 = 42;
    long valor2 = 0;
    long array[] = {10, 20, 30, 40, 50, 60, 70, 80};
    long resultado;

    // Load + Store clássico
    valor2 = valor1;

    // Acesso indexado
    resultado = array[3];   // 40

    printf("valor1     = %ld\n", valor1);
    printf("valor2     = %ld\n", valor2);
    printf("array[3]   = %ld\n", resultado);

    // Exemplo com inline assembly (load direto)
    long temp;
    __asm__ (
        "mov %1, %%rax\n\t"
        "mov %%rax, %0\n\t"
        : "=r" (temp)
        : "m" (array[4])          // array[4] = 50
        : "rax"
    );

    printf("array[4] (via asm) = %ld\n", temp);

    return 0;
}
