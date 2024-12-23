//
//  Application.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

@main
struct Main {
    static func main() {
        var board = STM32F746Board()

        while true {
            for color in UInt8.grayShades {
                FrameBuffer.fillCurrent(.init(l: color))
                board.moveLayer(to: .init(x: 0, y: 0))
                board.ledToggle()
                delay(ms: 42)
            }
        }
    }
}
