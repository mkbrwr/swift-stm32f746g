//
//  Board+Screen.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import Screen

extension STM32F746Board: Screen {
    var size: (width: Int, height: Int) {
        (width: 480, height: 272)
    }

    func draw(_ color: UInt8, at: (Int, Int)) {
        FrameBuffer.draw(color: .init(l: color), at: .init(x: at.0, y: at.1))
    }
}
