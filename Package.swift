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
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMinor(from: "2.0.1")),
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
