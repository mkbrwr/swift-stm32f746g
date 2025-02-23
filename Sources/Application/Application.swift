//
//  Application.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import UART
import FooBar

@main
struct Main {
    static func main() {
        let board = STM32F746Board()
        let uart = UART()
        var random = RandomNumberGeneratorPeripheral()

        FooBar.foo()

        while true {
            uart.write("Hello ");
            uart.write(UInt8.random(in: 48...57, using: &random))
            uart.write("\r\n")
            for x in 0..<board.size.width {
                for y in 0..<board.size.height {
                    let color: UInt32 = x == y ? 0xffff00ff : 0xffffffff
                    board.draw(color, at: (x, y) )
                }
            }
        }
    }
}
