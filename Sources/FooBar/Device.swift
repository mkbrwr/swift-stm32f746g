/// Flexible memory controller
let fmc = FMC(unsafeAddress: 0xa0000000)

// GPIO
let gpioc = GPIOC(unsafeAddress: 0x4002_0800)
let gpiod = GPIOD(unsafeAddress: 0x4002_0C00)
let gpioe = GPIOD(unsafeAddress: 0x4002_1000)
let gpiof = GPIOD(unsafeAddress: 0x4002_1400)
let gpiog = GPIOD(unsafeAddress: 0x4002_1800)
let gpioh = GPIOD(unsafeAddress: 0x4002_1C00)

/// Reset and clock control
let rcc = RCC(unsafeAddress: 0x4002_3800)

