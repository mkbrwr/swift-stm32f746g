//
//  FrameBuffer.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

// 127K frame buffer for 480x272 at L8
struct FrameBuffer {
    public static let layerWidth = 480
    public static let layerHeight = 272
    public static let startAddress1 = 0x2003_0200
    public static let endAddress = 0x2005_0000

    static let displayFrameBuffer = UnsafeMutablePointer<UInt8>(bitPattern: Self.startAddress1)!
    static let bufferIndices: Range<Int> = 0..<(layerWidth * layerHeight)

    private init() {}

    static func getDisplayFrame() -> UnsafeMutablePointer<UInt8> {
        displayFrameBuffer
    }

    static func draw(color: Color, at point: Point) {
        displayFrameBuffer[point.y * layerWidth + point.x] = color.l
    }

    static func fillCurrent(_ color: Color) {
        for idx in bufferIndices {
            displayFrameBuffer[idx] = color.l
        }
    }

    static func eraseCurrent() {
        for idx in bufferIndices {
            displayFrameBuffer[idx] = 0x00
        }
    }

    struct Color {
        /// Luminance value
        var l: UInt8
    }
}

public extension UInt8 {
    static let grayShades: [UInt8] = [
        0, 28, 56, 84, 112, 140, 168, 196, 224, 255
    ]

    static let black: UInt8 = grayShades[0]      // 0
    static let darkGray: UInt8 = grayShades[2]   // 56
    static let gray: UInt8 = grayShades[4]       // 112
    static let lightGray: UInt8 = grayShades[7]  // 196
    static let white: UInt8 = grayShades[9]      // 255
}
