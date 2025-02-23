// Generated by svd2swift.

import MMIO

/// General-purpose I/Os
let gpioa = GPIOA(unsafeAddress: 0x4002_0000)

/// General-purpose I/Os
let gpiob = GPIOB(unsafeAddress: 0x4002_0400)

/// Reset and clock control
let rcc = RCC(unsafeAddress: 0x4002_3800)

/// Universal synchronous asynchronous receiver transmitter
let usart1 = USART1(unsafeAddress: 0x4001_1000)

/// Random Number Generator Peripheral
let rng = RNG(unsafeAddress: 0x5006_0800)
