//
//  Screen.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

public protocol Screen {
    associatedtype Color
    associatedtype Position
    var size: (width: Int, height: Int) { get }
    func draw(_ color: Color, at: Position)
}
