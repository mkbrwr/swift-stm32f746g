//
//  Application.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import Board
import Engine

@main
struct Game {
    static func main() {
        var engine = Engine()
        let screen = STM32F746Board()
        engine.start()

        while true {
            // engine.receive(inputs: [])
            engine.update()
            engine.draw(on: screen)
            delay(ms: 16)
        }
    }
}
