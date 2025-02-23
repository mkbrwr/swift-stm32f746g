//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//
import SDRAM

public struct STM32F746Board {
    var led: LED!
    var button: Button!

    public init() {
        led = LED()
        button = Button()

        STM32F746.initializeLTCD()

        STM32F746.configureFlash()

        STM32F746.configureLTCD()

        SDRAM.initializeSDRAM()
    }

    public mutating func ledOn() {
        led.on()
    }

    public mutating func ledOff() {
        led.off()
    }

    public mutating func ledToggle() {
        led.toggle()
    }

    public func isButtonPressed() -> Bool {
        button.isPressed()
    }

    public var displaySize: (width: Int, height: Int) {
        (width: STM32F746.LTDCConstants.layerWidth,
        height: STM32F746.LTDCConstants.layerHeight)
    }
}
