import MMIO

/// Debug support
public let dbgmcu = DBGMCU(unsafeAddress: 0xe004_2000)

/// Universal synchronous asynchronous receiver transmitter
public let usart1 = USART1(unsafeAddress: 0x4001_1000)

/// Reset and clock control
public let rcc = RCC(unsafeAddress: 0x4002_3800)

/// LCD-TFT Controller
public let ltdc = LTDC(unsafeAddress: 0x4001_6800)

/// Flexible memory controller
public let fmc = FMC(unsafeAddress: 0xa000_0000)

/// FLASH
public let flash = FLASH(unsafeAddress: 0x4002_3c00)

/// Power control
public let pwr = PWR(unsafeAddress: 0x4000_7000)

/// System configuration controller
public let syscfg = SYSCFG(unsafeAddress: 0x4001_3800)

/// General-purpose I/Os
public let gpioa = GPIOA(unsafeAddress: 0x4002_0000)

/// General-purpose I/Os
public let gpiob = GPIOB(unsafeAddress: 0x4002_0400)

/// General-purpose I/Os
public let gpioc = GPIOC(unsafeAddress: 0x4002_0800)

/// General-purpose I/Os
public let gpiod = GPIOD(unsafeAddress: 0x4002_0c00)

/// General-purpose I/Os
public let gpioe = GPIOE(unsafeAddress: 0x4002_1000)

/// General-purpose I/Os
public let gpiof = GPIOF(unsafeAddress: 0x4002_1400)

/// General-purpose I/Os
public let gpiog = GPIOG(unsafeAddress: 0x4002_1800)

/// General-purpose I/Os
public let gpioh = GPIOH(unsafeAddress: 0x4002_1c00)

/// General-purpose I/Os
public let gpioi = GPIOI(unsafeAddress: 0x4002_2000)

/// General-purpose I/Os
public let gpioj = GPIOJ(unsafeAddress: 0x4002_2400)

/// General-purpose I/Os
public let gpiok = GPIOK(unsafeAddress: 0x4002_2800)
