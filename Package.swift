// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "Swift-STM32F746G-BSP",
  platforms: [
    .macOS(.v10_15)
  ],
  products: [
    .library(name: "Application", type: .static, targets: ["Application"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Application",
      dependencies: [
        "Support",
      ],
      swiftSettings: [
        .enableExperimentalFeature("Embedded")
      ]),
    .target(name: "Support"),
  ])
