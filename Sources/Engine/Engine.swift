//
//  Engine.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import Screen

public struct Engine<S: Screen> where S.Color == Color, S.Position == Point {
    let screen: S

    public init(screen: S) {
        self.screen = screen
    }

    var entities: [Entity] = [
        Entity(
            position: .init(x: 0, y: 0),
            direction: .init(x: 1, y: 2),
            sprite: .init(size: .init(width: 10, height: 10), color: (0xff))
        )
    ]

    public func start() {
        for entity in entities {
            entity.move()
            draw(entity.sprite, at: entity.position)
        }
    }

    public func update() {
        for entity in entities {
            draw(entity.sprite, at: entity.position)
        }
    }

    public func receive(inputs: [Input]) {
        for input in inputs {
            handle(input: input)
        }
    }

    private func draw(_ sprite: Sprite, at: Vec2) {
        for x in 0..<sprite.size.width {
            for y in 0..<sprite.size.height {
                screen.draw(sprite.color, at: (at.x + x, at.y + y))
            }
        }
    }

    private func handle(input: Input) {
        switch input {
        case .buttonPress:
            for entity in entities {
                entity.move()
            }
        }
    }
}
