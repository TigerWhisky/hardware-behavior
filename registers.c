/*
 * registers.c
 * O mesmo exemplo usando C + inline assembly
 * mostrando a relação entre C e o hardware
 */

#include <stdio.h>

int main() {
    long resultado;

    __asm__ (
        "mov $10, %%rax\n\t"
        "mov $25, %%rbx\n\t"
        "mov $3,  %%rcx\n\t"
        "mov $7,  %%rdx\n\t"
        "add %%rbx, %%rax\n\t"
        "imul %%rcx, %%rax\n\t"
        "sub %%rdx, %%rax\n\t"
        "mov %%rax, %0\n\t"
        : "=r" (resultado)        // output
        :                         // inputs (nenhum)
        : "rax", "rbx", "rcx", "rdx"  // clobbered registers
    );

    printf("Resultado final em RAX: %ld\n", resultado);
    return 0;
}
