//
//  FrameBuffer.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

// 95K frame buffer for 240x136 at RGB888
struct FrameBuffer {
    public static let startAddress = 0x20038000
    public static let endAddress   = 0x20050000

    static func fillBuffer(color: Color) {
        let pointer = UnsafeMutablePointer<(UInt8, UInt8, UInt8)>(bitPattern: startAddress)!
        for x in 0..<(240*136) {
            pointer.advanced(by: x).pointee = (UInt8(color.r), UInt8(color.g), UInt8(color.b))
        }
    }
}
