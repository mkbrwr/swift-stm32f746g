//
//  Engine.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import RandomNumberGenerator
import Logger

public protocol Screen {
    func draw(_ color: UInt32, at: (Int, Int))
    func reloadScreen()
    var  size: (width: Int, height: Int) { get }
}
public struct Engine {
    var entity1 = Entity(
        position: .init(x: 200, y: 200),
        direction: .init(x: 3, y: 1),
        sprite: .init(size: .init(width: 10, height: 40), color: (0xffff0000))
        )
    var entity2 = Entity(
        position: .init(x: 100, y: 100),
        direction: .init(x: 1, y: 2),
        sprite: .init(size: .init(width: 30, height: 20), color: (0xffff00ff))
    )

    public init() {}

    public mutating func start() {
    }

    // public mutating func receive(inputs: Array<Input>) {
    // }

    public mutating func update() {
         entity1.move()
         entity2.move()
    }

    public func draw<S: Screen>(on screen: borrowing S) {
        // Clear screen
        for x in 0..<screen.size.width {
            for y in 0..<screen.size.height {
                screen.draw(0x00_00_00_00, at: (x: x, y: y))
            }
        }

        // Draw entity1
        for x in 0..<entity1.sprite.size.width {
            for y in 0..<entity1.sprite.size.height {
                screen.draw(
                    entity1.sprite.color,
                    at: (
                        x: entity1.position.x + x,
                        y: entity1.position.y + y
                    )
                )
            }
        }

        // Draw entity2
        for x in 0..<entity2.sprite.size.width {
            for y in 0..<entity2.sprite.size.height {
                screen.draw(
                    entity2.sprite.color,
                    at: (
                        x: entity2.position.x + x,
                        y: entity2.position.y + y
                    )
                )
            }
        }

        screen.reloadScreen()
    }
}
