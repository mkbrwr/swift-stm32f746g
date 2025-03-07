//
//  FrameBuffer.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

/// 480x272 at ARGB8888
public final class FrameBuffer: @unchecked Sendable {
    let layerWidth = 480
    let layerHeight = 272
    let startAddress0: UInt = 0xC000_0000
    let endAddress0:   UInt = 0xC007_F800
    let startAddress1: UInt = 0xC007_F800
    let endAddress1:   UInt = 0xC00F_F000

    private let buffer0 = UnsafeMutablePointer<UInt32>(bitPattern: UInt(0xC000_0000))!
    private let buffer1 = UnsafeMutablePointer<UInt32>(bitPattern: UInt(0xC007_F800))!
    private var bufferIndices: Range<Int> {
        0..<(layerWidth * layerHeight)
    }

    public static let shared = FrameBuffer()
    private init() {}

    private var selectedBuffer = 0
    var frontBufferAddress: UInt {
        selectedBuffer == 0 ? startAddress0 : startAddress1
    }
    private var backBuffer: UnsafeMutablePointer<UInt32>! {
        selectedBuffer == 0 ? buffer1 : buffer0
    } 

    public func swapBuffers() {
        if selectedBuffer == 0 {
            selectedBuffer = 1
        } else {
            selectedBuffer = 0
        }
    }

    public func draw(color: UInt32, at point: (x: Int, y: Int)) {
        guard point.y * layerWidth + point.x < layerWidth * layerHeight else { return }
        guard point.y * layerWidth + point.x > 0 else { return }
        backBuffer[point.y * layerWidth + point.x] = color
    }

    public func fill(_ color: UInt32) {
        for idx in bufferIndices {
            backBuffer[idx] = color
        }
    }
}
