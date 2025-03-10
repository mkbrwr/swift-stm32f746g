//
//  Sprite.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

protocol Sprite {
    associatedtype T: Texture
    var size: Size { get }
    var texture: T { get } 
}

extension Sprite {
    func draw<S: Screen>(on screen: S, at: (x: Coordinate, y: Coordinate)) {
        for width in 0..<size.width {
            for height in 0..<size.height {
                screen.draw(texture.getPixel(at: (width, height)), at: (at.x + Int(width), at.y + Int(height)))
            }
        }
    }
}

struct SingleColorSprite: Sprite {
    let size: Size
    let texture: SingleColorTexture

    init(size: Size, color: Color) {
        self.size = size
        self.texture = SingleColorTexture(size: size, color: color)
    }
}