//
//  Geometry.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

struct Vec2 {
    let x, y: Coordinate

    func offset(by: Self) -> Self {
        Self(x: self.x + by.x, y: self.y + by.y)
    }
}

struct Rect {
    let origin: Vec2
    let size: Size
}

struct Size {
    let width, height: UInt

    func canFit(_ other: Self) -> Bool {
        width > other.width && height > other.height
    }
}

struct Vec2D {
    let x: Float
    let y: Float
}

extension Vec2D {
    init(_ x: Float, _ y: Float) {
        self.init(x: x, y: y)
    }
}

struct Vec3D {
    let x: Float
    let y: Float
    let z: Float
}

extension Vec3D {
    init(_ x: Float, _ y: Float, _ z: Float) {
        self.init(x: x, y: y, z: z)
    }
}

struct Camera {
    let position: Vec3D
    let rotation: Vec3D
    let fovAngle: Float
}

func vec3RotateX(_ v: Vec3D, angle: Float) -> Vec3D {
    let cosA = cos(angle)
    let sinA = sin(angle)

    let newY = v.y * cosA - v.z * sinA
    let newZ = v.y * sinA + v.z * cosA

    return Vec3D(v.x, newY, newZ)
}
func vec3RotateY(_ v: Vec3D, angle: Float) -> Vec3D {
    let cosA = cos(angle)
    let sinA = sin(angle)

    let newX = v.x * cosA + v.z * sinA
    let newZ = -v.x * sinA + v.z * cosA

    return Vec3D(newX, v.y, newZ)
}

func vec3RotateZ(_ v: Vec3D, angle: Float) -> Vec3D {
    let cosA = cos(angle)
    let sinA = sin(angle)

    let newX = v.x * cosA - v.y * sinA
    let newY = v.x * sinA + v.y * cosA

    return Vec3D(newX, newY, v.z)
}
