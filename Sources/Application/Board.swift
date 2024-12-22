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

struct STM32F746Board {
    var led: LED!
    var button: Button!

    init() {
        led = LED()
        button = Button()

        STM32F746.initializeLTCD()

        STM32F746.configureFlash()

        STM32F746.configureLTCD()
    }

    mutating func ledOn() {
        led.on()
    }

    mutating func ledOff() {
        led.off()
    }

    mutating func ledToggle() {
        led.toggle()
    }

    mutating func setBackgroundColor(color: Color) {
        STM32F746.setBackgroundColor(color)
    }

    func isButtonPressed() -> Bool {
        button.isPressed()
    }

    var displaySize: Size {
        Size(
            width: STM32F746.LTDCConstants.layerWidth,
            height: STM32F746.LTDCConstants.layerHeight
        )
    }
}
