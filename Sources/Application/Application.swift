//
//  Application.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import UART

@main
struct Main {
    static func main() {
        var board = STM32F746Board()
        let uart = UART()
        var random = RandomNumberGeneratorPeripheral()

        while true {
            uart.write("Hello ");
            uart.write(UInt8.random(in: 48...57, using: &random))
            uart.write("\r\n")
            board.ledToggle()
        }
    }
}
