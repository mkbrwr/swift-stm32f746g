//
//  Engine.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

public protocol Screen {
    func draw(_ color: UInt32, at: (Int, Int))
    var  size: (width: Int, height: Int) { get }
}

public struct Engine {
    var entities: [Entity]
    private var screenSize: (width: Int, height: Int) = (480, 272)

    public init() {
        entities = [
            Entity(
                position: .init(x: 100, y: 100),
                direction: .init(x: 3, y: 1),
                sprite: .init(size: .init(width: 10, height: 40), color: (0xffff0000))
            ),
            Entity(
                position: .init(x: 50, y: 50),
                direction: .init(x: 2, y: 3),
                sprite: .init(size: .init(width: 60, height: 60), color: (0xff00ff00))
            ),
            Entity(
                position: .init(x: 300, y: 150),
                direction: .init(x: -2, y: -1),
                sprite: .init(size: .init(width: 80, height: 80), color: (0xff0000ff))
            )
        ]
    }

    public func start() {
    }

    // public mutating func receive(inputs: Array<Input>) {
    // }

    public mutating func update() {
        for i in 0..<entities.count {
            // Check for collision with screen edges before moving
            let entity = entities[i]
            
            // Check X boundaries (left and right edges)
            if entity.position.x <= 0 || entity.position.x + entity.sprite.size.width >= screenSize.width {
                // Reverse X direction
                entities[i].reverseXDirection()
            }
            
            // Check Y boundaries (top and bottom edges)
            if entity.position.y <= 0 || entity.position.y + entity.sprite.size.height >= screenSize.height {
                // Reverse Y direction
                entities[i].reverseYDirection()
            }
            
            // Move the entity
            entities[i].move()
        }
    }

    public mutating func draw<S: Screen>(on screen: borrowing S) {
        // Update the screen size
        screenSize = screen.size
        
        // Clear screen
        for x in 0..<screen.size.width {
            for y in 0..<screen.size.height {
                screen.draw(0x00_00_00_00, at: (x: x, y: y))
            }
        }

        // Draw all entities
        for entity in entities {
            for x in 0..<entity.sprite.size.width {
                for y in 0..<entity.sprite.size.height {
                    screen.draw(
                        entity.sprite.color,
                        at: (
                            x: entity.position.x + x,
                            y: entity.position.y + y
                        )
                    )
                }
            }
        }
    }
}
