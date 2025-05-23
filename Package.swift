// swift-tools-version: 6.1.0

import PackageDescription

let package = Package(
    name: "Swift-STM32F746G",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(name: "Application", targets: ["Application"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-mmio", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "Application",
            dependencies: [
                "Support",
                .product(name: "MMIO", package: "swift-mmio"),
            ]),
        .target(name: "Support"),
    ])
