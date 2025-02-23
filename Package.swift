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
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags(["-no-allocations"])
      ]),
    .target(
      name: "UART",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(
      name: "SDRAM",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio"),
        "Support"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
      .target(
      name: "Board",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio"),
        "SDRAM"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(
      name: "Engine",
      dependencies: ["RandomNumberGenerator", "Logger"],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(
      name: "RandomNumberGenerator",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(
      name: "Logger",
      dependencies: [
        "UART"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded"),
        .unsafeFlags(["-no-allocations"])
      ]),
    .target(name: "Support"),
  ])
