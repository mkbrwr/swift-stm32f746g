//
//  Engine.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

public struct Engine {
    var entities: [Entity]

    public init() {
        entities = [
            Entity(
                position: .init(x: 100, y: 100),
                direction: .init(x: 3, y: 1),
                sprite: .singleColorSprite(SingleColorSprite(size: .init(width: 10, height: 40), color: (0xffff0000)))
            ),
            Entity(
                position: .init(x: 50, y: 50),
                direction: .init(x: 2, y: 3),
                sprite: .singleColorSprite(SingleColorSprite(size: .init(width: 60, height: 60), color: (0xff00ff00)))
            ),
            Entity(
                position: .init(x: 300, y: 150),
                direction: .init(x: -2, y: -1),
                sprite: .singleColorSprite(SingleColorSprite(size: .init(width: 80, height: 80), color: (0xff0000ff)))
            )
        ]
    }

    public func start() {
    }

    public mutating func receive(inputs: [Input]) {
        for input in inputs {
            switch input {
                case .buttonPress:
                    entities.append(
                        .init(
                            position: .init(x: 50, y: 50),
                            direction: .init(x: 2, y: 3),
                            sprite: .bufferBackedSprite(BufferBackedSprite.init(size: .init(width: 50, height: 50), texture: .init(size: .init(width: 50, height: 50), pixelBuffer: .init(bitPattern: 0x424242)!)))
                        )
                    )
            }
        }
    }

    public mutating func update() {
        let screenSize = (width: 480, height: 272)
        for i in 0..<entities.count {
            let entity = entities[i]
            
            if entity.position.x <= 0 || entity.position.x + Int(entity.sprite.size.width) >= screenSize.width {
                entities[i].reverseXDirection()
            }
            
            if entity.position.y <= 0 || entity.position.y + Int(entity.sprite.size.height) >= screenSize.height {
                entities[i].reverseYDirection()
            }
            
            entities[i].move()
        }
    }

    public mutating func draw<S: Screen>(on screen: S) {
        for entity in entities {
            entity.sprite.draw(on: screen, at: (entity.position.x, entity.position.y))
        }
    }
}
