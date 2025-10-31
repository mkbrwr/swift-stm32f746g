struct Vec3 {
    let x, y, z: Int
}

struct Face {
    /// Index
    let a, b, c: Int
}

func cubeVertices() -> [Vec3] {
    [
        .init(x: -1, y: -1, z: -1),  // 1
        .init(x: -1, y: 1, z: -1),  // 2
        .init(x: 1, y: 1, z: -1),  // 3
        .init(x: 1, y: -1, z: -1),  // 4
        .init(x: 1, y: 1, z: 1),  // 5
        .init(x: 1, y: -1, z: 1),  // 6
        .init(x: -1, y: 1, z: 1),  // 7
        .init(x: -1, y: -1, z: 1),  // 8
    ]
}

func cubeFaces() -> [Face] {
    [
        // front
        .init(a: 1, b: 2, c: 3),
        .init(a: 1, b: 3, c: 4),
        // right
        .init(a: 4, b: 3, c: 5),
        .init(a: 4, b: 5, c: 6),
        // back
        .init(a: 6, b: 5, c: 7),
        .init(a: 6, b: 7, c: 8),
        // left
        .init(a: 8, b: 7, c: 2),
        .init(a: 8, b: 2, c: 1),
        // top
        .init(a: 2, b: 7, c: 5),
        .init(a: 2, b: 5, c: 3),
        // bottom
        .init(a: 6, b: 8, c: 1),
        .init(a: 6, b: 1, c: 4),
    ]
}
