//
//  Geometry.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

struct Point {
    var x, y: Int

    func offset(by: Point) -> Point {
        Point(x: x + by.x, y: y + by.y)
    }
}

struct Size {
    var width, height: Int
}
