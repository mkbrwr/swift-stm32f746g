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

        moveLayer(to: .init(x: 120, y: 66))
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

    mutating func moveLayer(to point: Point) {
        STM32F746.setLayer2Position(point)
    }

    mutating func reloadLayer() {
        STM32F746.reloadLayer2()
    }

    mutating func setBackgroundColor(color: FrameBuffer.Color) {
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

struct Point {
    var x, y: Int

    func offset(by: Point) -> Point {
        Point(x: x + by.x, y: y + by.y)
    }
}

struct Size {
    var width, height: Int
}
