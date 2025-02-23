//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import Support

public struct UART {
  public init() {
    configure()
  }
  
  private func configure() {
    // MARK: Clock configuration
    rcc.ahb1enr.modify { rw in
      // Enable AHB clock to port A
      rw.raw.gpioaen = 1
      // Enable AHB clock to port B
      rw.raw.gpioben = 1
    }
    // Enable APB clock to usart 1
    rcc.apb2enr.modify { $0.raw.usart1en = 1 }

    // MARK: Peripheral Configuration
    // Configure A9 as UART1 TX
    // Put Pin A9 into alternate function mode
    gpioa.moder.modify { $0.raw.moder9 = 0b10 }
    // Put Pin A9 into push pull
    gpioa.otyper.modify { $0.raw.ot9 = 0b0 }
    // Put Pin A9 into low speed
    gpioa.ospeedr.modify { $0.raw.ospeedr9 = 0b00 }
    // Disable pull up/down on Pin A9
    gpioa.pupdr.modify { $0.raw.pupdr9 = 0b00 }
    // Set alternate function usart1 on Pin A9
    gpioa.afrh.modify { $0.raw.afrh9 = 0b0111 }

    // Configure B7 as UART1 RX
    // Put Pin B7 into alternate function mode
    gpiob.moder.modify { $0.raw.moder7 = 0b10 }
    // Put Pin B7 into push pull
    gpiob.otyper.modify { $0.raw.ot7 = 0b0 }
    // Put Pin B7 into low speed
    gpiob.ospeedr.modify { $0.raw.ospeedr7 = 0b00 }
    // Disable pull up/down on Pin B7
    gpiob.pupdr.modify { $0.raw.pupdr7 = 0b00 }
    // Set alternate function usart1 on Pin B7
    gpiob.afrl.modify { $0.raw.afrl7 = 0b0111 }

    // Configure UART1
    // Set the baud rate to 216Mhz
    usart1.brr.modify { $0.raw.storage = 200_000_000 / 115200 }

    usart1.cr1.modify { rw in
      // Enable USART 1
      rw.raw.ue = 1
      // Enable RX
      rw.raw.re = 1
      // Enable TX
      rw.raw.te = 1
    }
  }

  public func write(_ string: String) {
    for character in string.utf8 {
      write(character)
    }
  }

  public func write(_ character: UInt8) {
      tx(value: character)
      waitTxBufferEmpty()
  }
}

private func waitTxBufferEmpty() {
  // Spin while tx buffer not empty
  while usart1.isr.read().raw.txe == 0 {}
}

private func tx(value: UInt8) {
  usart1.tdr.write { $0.raw.tdr_field = UInt32(value) }
}

private func waitRxBufferFull() {
  // Spin while rx buffer empty
  while usart1.isr.read().raw.rxne == 0 {}
}

private func rx() -> UInt8 {
  UInt8(usart1.rdr.read().raw.rdr_field)
}