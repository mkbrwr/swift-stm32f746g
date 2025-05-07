//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

#include <stdint.h>
#include <stddef.h>

extern int main(int argc, char *argv[]);

void FPU_Init(void);

void reset(void) {
    FPU_Init();
    main(0, NULL);
}

void interrupt(void) {
    while (1) {}
}

__attribute((used, section(".vectors")))
void *vector_table[114] = {
    (void *)0x20050000,
    reset, // Reset

    interrupt, // NMI
    interrupt, // HardFault
    interrupt, // MemManage
    interrupt, // BusFault
    interrupt, // UsageFault

    0 // NULL for all the other handlers
};

void FPU_Init(void)
{
  // Enable CP10 and CP11 coprocessors for FPU in CPACR
  // CPACR address: 0xE000ED88
  *((volatile uint32_t*)0xE000ED88) |= ((3UL << 20) | (3UL << 22));  // Set CP10 and CP11 Full Access

  // Initialize the FPU FPCCR register
  // FPU_FPCCR address: 0xE000EF34
  *((volatile uint32_t*)0xE000EF34) |= (1UL << 30) | (1UL << 31);  // Enable ASPEN and LSPEN bits

  // Set FPU mode in FPDSCR: Round to nearest, flush-to-zero for denormals
  // FPU_FPDSCR address: 0xE000EF3C
  *((volatile uint32_t*)0xE000EF3C) |= (1UL << 24);  // Enable FZ bit (flush-to-zero)

  // Memory barriers for synchronization
  // Data Synchronization Barrier
  __asm volatile ("dsb 0xF" ::: "memory");

  // Instruction Synchronization Barrier
  __asm volatile ("isb 0xF" ::: "memory");
}
