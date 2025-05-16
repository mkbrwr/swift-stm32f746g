import MMIO

/// Debug support
public let dbgmcu = DBGMCU(unsafeAddress: 0xe004_2000)

/// General-purpose I/Os
public let gpioa = GPIOA(unsafeAddress: 0x4002_0000)

/// Universal synchronous asynchronous receiver transmitter
public let usart1 = USART1(unsafeAddress: 0x4001_1000)

/// Reset and clock control
public let rcc = RCC(unsafeAddress: 0x4002_3800)
