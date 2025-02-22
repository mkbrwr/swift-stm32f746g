// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "Swift-STM32F746G",
  platforms: [
    .macOS(.v14)
  ],
  products: [
    .library(name: "Application", type: .static, targets: ["Application"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-mmio",
      branch: "swift-embedded-examples")
  ],
  targets: [
    .target(
      name: "Application",
      dependencies: [
        "Engine",
        "UART",
        "Support"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(
      name: "UART",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio"),
        "Support"
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(
      name: "Engine",
      dependencies: ["Screen"],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(
      name: "Screen",
      dependencies: [],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(name: "Support"),
  ])
