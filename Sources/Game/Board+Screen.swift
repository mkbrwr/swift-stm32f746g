//
//  Board+Screen.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import Engine
import Board

extension STM32F746Board: Screen {
    public var size: (width: Int, height: Int) {
        (width: 480, height: 272)
    }

    public func draw(_ color: UInt32, at: (x: Int, y: Int)) {
        FrameBuffer.shared.draw(color: color, at: (x: at.0, y: at.1))
    }

    public func swapBuffers() {
        FrameBuffer.shared.swapBuffers()
        STM32F746.reloadScreen()
    }

    public func clearBackBuffer(_ color: Color = 0xff000000) {
        FrameBuffer.shared.fill(color)
    }
}
