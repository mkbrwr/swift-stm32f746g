//
//  Sprite.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

enum Sprite  {
    case singleColorSprite(SingleColorSprite)
    case bufferBackedSprite(BufferBackedSprite)

    var size: Size {
        switch self {
            case let .singleColorSprite(sprite): return sprite.size
            case let .bufferBackedSprite(sprite): return sprite.size
        }
    }

    var texture: Texture {
        switch self {
            case let .singleColorSprite(sprite): return sprite.texture
            case let .bufferBackedSprite(sprite): return sprite.texture
        }
    }
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

struct SingleColorSprite {
    let size: Size
    let texture: Texture

    init(size: Size, color: Color) {
        self.size = size
        self.texture = .singleColorTexture(SingleColorTexture(size: size, color: color))
    }
}

struct BufferBackedSprite {
    let size: Size
    let texture: Texture
       init(size: Size, texture: BufferBackedTexture) {
        self.size = size
        self.texture = .bufferBackedTexture(texture)   
    }
}