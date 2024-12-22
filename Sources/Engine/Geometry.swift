//
//  Geometry.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

public typealias Point = (Int, Int)

struct Vec2 {
    let x, y: Int

    func offset(by: Self) -> Self {
        Vec2(x: self.x + by.x, y: self.y + by.y)
    }
}

struct Rect {
    let origin: Vec2
    let size: Vec2
}

struct Size {
    let width, height: Int
}
