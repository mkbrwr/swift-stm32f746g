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
            board.ledToggle()
            delay(ms: 42)
        }
    }
}
