//
//  Graphics.swift
//  Swift-STM32F746G-BSP
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//


struct Color {
    var r, g, b: Int
}


let rainbowColors: [(Int, Int, Int)] = [
    (255, 0, 0),    // Red
    (255, 127, 0),  // Orange
    (255, 255, 0),  // Yellow
    (0, 255, 0),    // Green
    (0, 0, 255),    // Blue
    (75, 0, 130),   // Indigo (a compromise, as true indigo is hard to represent digitally)
    (148, 0, 211)   // Violet
]
