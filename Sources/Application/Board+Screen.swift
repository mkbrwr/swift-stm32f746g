//
//  Board+Screen.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import Screen

extension STM32F746Board: Screen {
    var size: (width: Int, height: Int) {
        (width: 240, height: 136)
    }

    func draw(_ color: (UInt8, UInt8, UInt8), at: (Int, Int)) {
        FrameBuffer.draw(color: .init(r: color.0, g: color.1, b: color.2), at: .init(x: at.0, y: at.1))
    }
}
