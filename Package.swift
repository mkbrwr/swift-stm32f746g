// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "Swift-STM32F746G",
  platforms: [
    .macOS(.v14)
  ],
  products: [
    .library(name: "Application", type: .static, targets: ["Game"])
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
        "Engine"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(
      name: "UART",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"])
      ]),
    .target(
      name: "SDRAM",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio"),
        "Support"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"])
      ]),
      .target(
      name: "Board",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio"),
        "SDRAM"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"])
      ]),
    .target(
      name: "Engine",
      dependencies: ["RandomNumberGenerator", "Logger"],
      swiftSettings: [
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"])
      ]),
    .target(
      name: "RandomNumberGenerator",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags(["-Xfrontend", "-emit-empty-object-file"])
      ]),
    .target(
      name: "Logger",
      dependencies: [
        "UART"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags(["-no-allocations",
        "-Xfrontend", "-emit-empty-object-file"])
      ]),
    .target(name: "Support"),
  ])
