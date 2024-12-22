//
//  Entity.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

final class Entity {
    var position: Vec2
    var direction: Vec2
    let sprite: Sprite

    init(position: Vec2, direction: Vec2, sprite: Sprite) {
        self.position = position
        self.direction = direction
        self.sprite = sprite
    }
}

extension Entity {
    func move() {
        position = position.offset(by: direction)
    }
}
