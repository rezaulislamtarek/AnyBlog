// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonComponent",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CommonComponent",
            targets: ["CommonComponent"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/NuPlay/RichText.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CommonComponent",
            dependencies: [.product(name: "RichText", package: "RichText")]
        ),
        .testTarget(
            name: "CommonComponentTests",
            dependencies: ["CommonComponent"]),
    ]
)
