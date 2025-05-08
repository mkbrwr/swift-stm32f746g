//
//  Engine.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

public struct Engine {
    var cube: [Vec3D]
    var fov_factor: Float = 640

    public init() {
        cube = Self.createCube()
    }

    static func createCube() -> [Vec3D] {
        let min: Float = -1.0
        let max: Float = 1.0
        let step: Float = (max - min) / 8.0

        var points: [Vec3D] = []
        for i in 0..<9 {
            let x = min + Float(i) * step
            for j in 0..<9 {
                let y = min + Float(j) * step
                for k in 0..<9 {
                    let z = min + Float(k) * step

                    points.append(Vec3D(x, y, z))
                }
            }
        }
        return points
    }

    public func start() {
    }

    public mutating func receive(inputs: [Input]) {
    }

    public mutating func update() {
    }

    var cubeRotation: Float = 0.0
    var cameraPosition: Vec3D = .init(x: 0, y: 0, z: -5)

    func project(_ vec3: Vec3D) -> Vec2D {
        let z = vec3.z - cameraPosition.z
        return .init(vec3.x * fov_factor / z, vec3.y * fov_factor / z)
    }

    public mutating func draw<S: Screen>(on screen: S) {
        cubeRotation += 0.005

        // FIXME: tmp fix to reset rotation before it spins out of control
        if cubeRotation > .pi { cubeRotation = 0 }

        for point in cube {
            let transformedPointa = vec3RotateX(point, angle: cubeRotation)
            let transformedPointb = vec3RotateY(transformedPointa, angle: cubeRotation)
            let transformedPoint = vec3RotateZ(transformedPointb, angle: cubeRotation)

            // Translate the points away from the camera
            let translatedPoint = Vec3D(
                x: transformedPoint.x, y: transformedPoint.y,
                z: transformedPoint.z - cameraPosition.z)

            // Project the current point
            let projectedPoint = project(translatedPoint)

            screen.draw(
                0xffff_0000, at: (x: Int(projectedPoint.x) + 131, y: Int(projectedPoint.y) + 131))
            screen.draw(
                0xffff_0000, at: (x: Int(projectedPoint.x) + 132, y: Int(projectedPoint.y) + 131))
            screen.draw(
                0xffff_0000, at: (x: Int(projectedPoint.x) + 131, y: Int(projectedPoint.y) + 132))
            screen.draw(
                0xffff_0000, at: (x: Int(projectedPoint.x) + 132, y: Int(projectedPoint.y) + 132))
        }
    }
}
