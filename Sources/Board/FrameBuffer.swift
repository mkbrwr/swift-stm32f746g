//
//  FrameBuffer.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

/// 480x272 at ARGB8888
public struct FrameBuffer {
    public static let layerWidth = 480
    public static let layerHeight = 272
    public static let startAddress1: UInt = 0xC000_0000
    public static let endAddress: UInt = 0xC07F_8000

    static let displayFrameBuffer = UnsafeMutablePointer<UInt32>(bitPattern: Self.startAddress1)!
    static let bufferIndices: Range<Int> = 0..<(layerWidth * layerHeight)

    private init() {}

    public static func getDisplayFrame() -> UnsafeMutablePointer<UInt32> {
        displayFrameBuffer
    }

    public static func draw(color: Color, at point: (x: Int, y: Int)) {
        guard point.y * layerWidth + point.x < layerWidth * layerHeight else { return }
        guard point.y * layerWidth + point.x > 0 else { return }
        displayFrameBuffer[point.y * layerWidth + point.x] = color.argb
    }

    public static func fillCurrent(_ color: Color) {
        for idx in bufferIndices {
            displayFrameBuffer[idx] = color.argb
        }
    }

    public static func eraseCurrent() {
        for idx in bufferIndices {
            displayFrameBuffer[idx] = 0x00
        }
    }

    public struct Color {
        var argb: UInt32

        public init(argb: UInt32) {
            self.argb = argb
        }
    }
}
