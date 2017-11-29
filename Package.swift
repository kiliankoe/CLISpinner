// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "CLISpinner",
    products: [
        .library(
            name: "CLISpinner",
            targets: ["CLISpinner"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.3"),
    ],
    targets: [
        .target(
            name: "CLISpinner",
            dependencies: ["Rainbow"]),
        .testTarget(
            name: "CLISpinnerTests",
            dependencies: ["CLISpinner"]),
    ]
)
