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

        while true {
            uart.write("Hello!\r\n")
            board.ledToggle()
            delay(ms: 500)
        }
    }
}
