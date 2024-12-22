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

import Support

public protocol GPIOPlatform {
    associatedtype Pin
    static func configure(_ pin: Pin, _ configuration: GPIOConfiguration)
    static func assert(_ pin: Pin, _ configuration: GPIOConfiguration)
    static func deassert(_ pin: Pin, _ configuration: GPIOConfiguration)
    static func value(_ pin: Pin) -> Bool
}

public enum STM32F746 {}

public enum Mode {
    case input
    case output
    case alternateFunction
    case analog
}

public enum OutputType {
    case pushPull
    case openDrain
}

public enum OutputSpeed {
    case low
    case medium
    case high
    case max
}

public enum Pull {
    case `none`
    case up
    case down
}

public enum AlternateFunction {
    case alternateFunction0
    case alternateFunction1
    case alternateFunction2
    case alternateFunction3
    case alternateFunction4
    case alternateFunction5
    case alternateFunction6
    case alternateFunction7
    case alternateFunction8
    case alternateFunction9
    case alternateFunction10
    case alternateFunction11
    case alternateFunction12
    case alternateFunction13
    case alternateFunction14
    case alternateFunction15
    case `none`
}

public struct GPIOConfiguration {
    public var mode: Mode
    public var outputType: OutputType
    public var outputSpeed: OutputSpeed
    public var pull: Pull
    public var alternateFunction: AlternateFunction
    public var activeHigh: Bool

    public init(
        mode: Mode, outputType: OutputType, outputSpeed: OutputSpeed, pull: Pull,
        alternateFunction: AlternateFunction, activeHigh: Bool
    ) {
        self.mode = mode
        self.outputType = outputType
        self.outputSpeed = outputSpeed
        self.pull = pull
        self.alternateFunction = alternateFunction
        self.activeHigh = activeHigh
    }
}

public struct HALGPIO<Platform: GPIOPlatform> {
    let pin: Platform.Pin
    var configuration: GPIOConfiguration?

    public init(pin: Platform.Pin) {
        self.pin = pin
        self.configuration = nil
    }

    public mutating func configure(configuration: GPIOConfiguration) {
        self.configuration = configuration
        guard let configuration = self.configuration else { return }
        Platform.configure(pin, configuration)
    }

    public func assert() {
        guard let configuration = self.configuration else { return }
        Platform.assert(pin, configuration)
    }

    public func deassert() {
        guard let configuration = self.configuration else { return }
        Platform.deassert(pin, configuration)
    }

    public func value() -> Bool {
        Platform.value(pin)
    }
}

// MARK: - Abstract GPIO -> Platform GPIO
extension Mode {
    var rawValue: UInt8 {
        switch self {
        case .input: return 0x0
        case .output: return 0x1
        case .alternateFunction: return 0x2
        case .analog: return 0x3
        }
    }
}

extension OutputType {
    var rawValue: UInt8 {
        switch self {
        case .pushPull:
            return 0x0
        case .openDrain:
            return 0x1
        }
    }
}

extension OutputSpeed {
    var rawValue: UInt8 {
        switch self {
        case .low: return 0x0
        case .medium: return 0x1
        case .high: return 0x2
        case .max: return 0x3
        }
    }
}

extension Pull {
    var rawValue: UInt8 {
        switch self {
        case .none: return 0x0
        case .up: return 0x1
        case .down: return 0x2
        }
    }
}

extension AlternateFunction {
    var rawValue: UInt8 {
        switch self {
        case .alternateFunction0: return 0
        case .alternateFunction1: return 1
        case .alternateFunction2: return 2
        case .alternateFunction3: return 3
        case .alternateFunction4: return 4
        case .alternateFunction5: return 5
        case .alternateFunction6: return 6
        case .alternateFunction7: return 7
        case .alternateFunction8: return 8
        case .alternateFunction9: return 9
        case .alternateFunction10: return 10
        case .alternateFunction11: return 11
        case .alternateFunction12: return 12
        case .alternateFunction13: return 13
        case .alternateFunction14: return 14
        case .alternateFunction15: return 15
        case .none: return .max
        }
    }
}

// MARK: - GPIOPlatform Conformance
extension STM32F746: GPIOPlatform {
    public struct Pin {
        var port: GPIOPort
        var number: UInt8

        public init(port: GPIOPort, number: UInt8) {
            self.port = port
            self.number = number
        }

        func checkValidPin() {
            if self.number < 0 || self.number > 16 {
                fatalError("STM32F746: invalid GPIO pin number")
            }
        }

        func setMode(_ mode: Mode) {
            var rawValue = self.port.port
            rawValue.moder.setModer(n: Int(self.number), value: mode.rawValue)
        }

        func setOutputType(_ outputType: OutputType) {
            var rawValue = self.port.port
            rawValue.otyper.setOt(n: Int(self.number), value: outputType.rawValue)
        }

        func setOutputSpeed(_ outputSpeed: OutputSpeed) {
            var rawValue = self.port.port
            rawValue.ospeedr.setOspeed(
                n: Int(self.number), value: outputSpeed.rawValue)
        }

        func setPull(_ pull: Pull) {
            var rawValue = self.port.port
            rawValue.pupdr.setPupd(n: Int(self.number), value: pull.rawValue)
        }

        func setAlternateFunction(_ alternateFunction: AlternateFunction) {
            var rawValue = self.port.port
            if self.number < 8 {
                rawValue.afrl.setAf(
                    n: Int(self.number), value: alternateFunction.rawValue)
            } else {
                rawValue.afrh.setAf(
                    n: Int(self.number), value: alternateFunction.rawValue)
            }
        }

        func setOutputData(_ data: UInt8) {
            var rawValue = self.port.port
            rawValue.odr.setOd(n: Int(self.number), value: data)
        }

        func getInputData() -> UInt8 {
            let rawValue = self.port.port
            switch self.number {
            case 0: return rawValue.idr.idr0
            case 1: return rawValue.idr.idr1
            case 2: return rawValue.idr.idr2
            case 3: return rawValue.idr.idr3
            case 4: return rawValue.idr.idr4
            case 5: return rawValue.idr.idr5
            case 6: return rawValue.idr.idr6
            case 7: return rawValue.idr.idr7
            case 8: return rawValue.idr.idr8
            case 9: return rawValue.idr.idr9
            case 10: return rawValue.idr.idr10
            case 11: return rawValue.idr.idr11
            case 12: return rawValue.idr.idr12
            case 13: return rawValue.idr.idr13
            case 14: return rawValue.idr.idr14
            case 15: return rawValue.idr.idr15
            default: fatalError("STM32F746: invalid GPIO pin number")
            }
        }
    }

    public static func configure(_ pin: Pin, _ configuration: GPIOConfiguration) {
        pin.checkValidPin()

        pin.setMode(configuration.mode)
        pin.setOutputType(configuration.outputType)
        pin.setOutputSpeed(configuration.outputSpeed)
        pin.setPull(configuration.pull)

        if configuration.mode == .alternateFunction {
            pin.setAlternateFunction(configuration.alternateFunction)
        }

    }

    public static func assert(_ pin: Pin, _ configuration: GPIOConfiguration) {
        if configuration.activeHigh {
            pin.setOutputData(1)
        } else {
            pin.setOutputData(0)
        }
    }

    public static func deassert(_ pin: Pin, _ configuration: GPIOConfiguration) {
        if configuration.activeHigh {
            pin.setOutputData(0)
        } else {
            pin.setOutputData(1)
        }
    }

    public static func value(_ pin: Pin) -> Bool {
        (pin.getInputData() & 0x1) != 0
    }
}

public enum GPIOPort: Int {
    case a, b, c, d, e, f, g, h, i, j, k

    var port: GPIO {
        // swift-format-ignore: NeverForceUnwrap
        GPIO(
            baseAddress: UnsafeMutableRawPointer(
                bitPattern: (0x4002_0000 + 0x400 * UInt(self.rawValue - Self.a.rawValue))
            )!)
    }
}

extension STM32F746 {
    public static func enableGPIOPortClock(_ port: GPIOPort) {
        // swift-format-ignore: NeverForceUnwrap
        var rcc = RCC(
            baseAddress: UnsafeMutableRawPointer(bitPattern: 0x4002_3800)!)
        switch port {
        case .a: rcc.ahb1enr.gpioaen = 1
        case .b: rcc.ahb1enr.gpioben = 1
        case .c: rcc.ahb1enr.gpiocen = 1
        case .d: rcc.ahb1enr.gpioden = 1
        case .e: rcc.ahb1enr.gpioeen = 1
        case .f: rcc.ahb1enr.gpiofen = 1
        case .g: rcc.ahb1enr.gpiogen = 1
        case .h: rcc.ahb1enr.gpiohen = 1
        case .i: rcc.ahb1enr.gpioien = 1
        case .j: rcc.ahb1enr.gpiojen = 1
        case .k: rcc.ahb1enr.gpioken = 1
        }
    }
}
