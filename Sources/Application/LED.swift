//
//  LED.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

struct LED {
    var led: HALGPIO<STM32F746>
    private(set) var isOn = false

    init() {
        STM32F746.enableGPIOPortClock(.i)
        led = HALGPIO<STM32F746>(pin: .init(port: .i, number: 1))
        led.configure(
            configuration: .init(
                mode: .output, outputType: .pushPull, outputSpeed: .high, pull: .down,
                alternateFunction: .none, activeHigh: true))
        led.deassert()
    }

    mutating func on() {
        led.assert()
        isOn = true
    }

    mutating func off() {
        led.deassert()
        isOn = false
    }

    mutating func toggle() {
        if isOn { off() } else { on() }
    }
}
