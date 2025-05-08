// swift-tools-version: 6.1.0

import PackageDescription

let package = Package(
    name: "Swift-STM32F746G",
    platforms: [
        .macOS("15.0")
    ],
    products: [
        .library(name: "Application", type: .static, targets: ["Game"]),
        .executable(name: "Playground", targets: ["Playground"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-mmio",
            branch: "swift-embedded-examples")
    ],
    targets: [
        .target(
            name: "Game",
            dependencies: [
                "Board",
                "Engine",
            ],
            swiftSettings: [
                .enableExperimentalFeature("Embedded")
            ]),
        .target(
            name: "Engine",
            // FIXME: .when(configuration: .release) is a tmp soulution to enable Playground
            swiftSettings: [
                .enableExperimentalFeature("Embedded", .when(configuration: .release)),
                .unsafeFlags(
                    ["-Xfrontend", "-emit-empty-object-file"], .when(configuration: .release)),
            ]),
        .target(
            name: "Board",
            dependencies: [
                "SDRAM"
            ],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"]),
            ]),
        .target(
            name: "SDRAM",
            dependencies: [
                "Device",
                "Support",
            ],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"]),
            ]),
        .target(
            name: "UART",
            dependencies: [
                "Device"
            ],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"]),
            ]),
        .target(
            name: "Device",
            dependencies: [
                .product(name: "MMIO", package: "swift-mmio")
            ],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"]),
            ]),
        .target(name: "Support"),

        // Playground
        .executableTarget(
            name: "Playground",
            dependencies: ["PlaygroundSupport", "Engine"],
            path: "Playground/Sources",
            resources: [.process("Shaders.metal")]
        ),
        .target(name: "PlaygroundSupport", path: "Playground/PlaygroundSupport"),
    ])
