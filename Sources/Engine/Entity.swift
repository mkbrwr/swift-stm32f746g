//
//  Entity.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

struct Entity {
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
    mutating func move() {
        position = position.offset(by: direction)
    }
    
    mutating func changeDirection(_ new: Vec2) {
        direction = new
    }
    
    mutating func reverseXDirection() {
        direction = Vec2(x: -direction.x, y: direction.y)
    }
    
    mutating func reverseYDirection() {
        direction = Vec2(x: direction.x, y: -direction.y)
    }
}
