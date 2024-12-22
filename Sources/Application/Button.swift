//
//  Button.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

struct Button {
    var pin = STM32F746.Pin(port: .i, number: 11)

    init() {
        STM32F746.enableGPIOPortClock(.i)
        pin.setMode(.input)
    }

    func isPressed() -> Bool {
        STM32F746.value(pin)
    }
}
