//
//  Application.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

@main
struct Main {
    static func main() {
        var led = LED()
        var button = Button()

        while true {
            if button.isPressed() {
                led.on()
            } else {
                led.toggle()
                delay(ms: 10)
            }
        }
    }
}
