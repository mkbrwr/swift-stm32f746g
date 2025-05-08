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
void RNG_Init(void);

void reset(void) {
    FPU_Init();
    RNG_Init();
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


// RNG peripheral registers
#define RNG_BASE           0x50060800
#define RNG_CR             (*(volatile uint32_t *)(RNG_BASE + 0x00))  // Control register
#define RNG_SR             (*(volatile uint32_t *)(RNG_BASE + 0x04))  // Status register
#define RNG_DR             (*(volatile uint32_t *)(RNG_BASE + 0x08))  // Data register

// RCC registers for enabling RNG
#define RCC_BASE           0x40023800
#define RCC_AHB2ENR        (*(volatile uint32_t *)(RCC_BASE + 0x34))  // AHB2 peripheral clock enable register

// RNG Control register bits
#define RNG_CR_RNGEN       (1U << 2)  // Random number generator enable
#define RNG_CR_IE          (1U << 3)  // Interrupt enable

// RNG Status register bits
#define RNG_SR_DRDY        (1U << 0)  // Data ready
#define RNG_SR_CECS        (1U << 1)  // Clock error current status
#define RNG_SR_SECS        (1U << 2)  // Seed error current status

// RCC AHB2ENR register bits
#define RCC_AHB2ENR_RNGEN  (1U << 6)  // Random number generator clock enable

void RNG_Init(void) {
    RCC_AHB2ENR |= RCC_AHB2ENR_RNGEN;
    RNG_CR |= RNG_CR_RNGEN;
}

int rng_get_random(uint32_t *random_value) {
    uint32_t timeout = 1000000;

    while (!(RNG_SR & RNG_SR_DRDY)) {
        if (RNG_SR & (RNG_SR_CECS | RNG_SR_SECS)) {
            RNG_CR &= ~RNG_CR_RNGEN;
            RNG_CR |= RNG_CR_RNGEN;
            return 0;
        }

        if (--timeout == 0) {
            return 0;
        }
    }

    *random_value = RNG_DR;
    return 1;
}

void arc4random_buf(void *buf, size_t nbytes) {
    uint8_t *buffer = (uint8_t *)buf;
    uint32_t random_value;

    for (size_t i = 0; i < nbytes; i++) {
        if (i % 4 == 0) {
            while (!rng_get_random(&random_value)) {
            }
        }

        buffer[i] = (uint8_t)(random_value >> (8 * (i % 4)));
    }
}
