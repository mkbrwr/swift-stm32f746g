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
            for color in rainbowColors {
                FrameBuffer.fillBuffer(color: Color(r: color.0, g: color.1, b: color.2))
                board.reloadLayer()
                board.ledToggle()
                delay(ms: 500)
            }
        }
    }
}
