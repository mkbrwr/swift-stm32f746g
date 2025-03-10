//
//  Geometry.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

struct Vec2 {
    let x, y: Coordinate

    func offset(by: Self) -> Self {
        Self(x: self.x + by.x, y: self.y + by.y)
    }
}

struct Rect {
    let origin: Vec2
    let size: Size
}

struct Size {
    let width, height: UInt

    func canFit(_ other: Self) -> Bool {
        width > other.width && height > other.height
    }  
}

