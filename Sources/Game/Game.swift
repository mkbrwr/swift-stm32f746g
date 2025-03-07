//
//  Application.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import Board
import Engine
import UART

@main
struct Game {
    static func main() {
        var engine = Engine()
        var screen = STM32F746Board()
        let uart = UART()
        engine.start()

        while true {
            // engine.receive(inputs: [])
            engine.update()
            engine.draw(on: screen)
            screen.swapBuffers()
            uart.write(49)
            delay(ms: 1)
        }
    }
}
