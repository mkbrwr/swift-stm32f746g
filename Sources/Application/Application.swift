//
//  Application.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import Support
import Engine

@main
struct Main {
    static func main() {
        var board = STM32F746Board()
        let engine = Engine(screen: board)

        engine.start()

        while true {
            FrameBuffer.fillBuffer(color: FrameBuffer.Color(r: 0x00, g: 0x00, b: 0x00))
            engine.update()
            if board.isButtonPressed() {
                engine.receive(inputs: [.buttonPress])
            }
            board.reloadLayer()
            board.ledToggle()
            delay(ms: 42)
        }
    }
}
