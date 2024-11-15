// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Blog",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Blog",
            targets: ["Blog"]),
    ],
    dependencies: [
        .package(path: "../Router"),
        .package(path: "../EasyNet"),
        .package(path: "../CommonComponent"),
        .package(path: "../Utils"),
        .package(path: "../TestUtilities")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Blog",
            dependencies: [
                .product(name: "EasyNet", package: "EasyNet"),
                .product(name: "CommonComponent", package: "CommonComponent"),
                .product(name: "Router", package: "Router"),
                .product(name: "Utils", package: "Utils"),
                .product(name: "TestUtilities", package: "TestUtilities"),
                 
            ],
            resources: [
                .process("Resources/mock_blog_posts.json"),
                .process("Resources/moc_ios_tag_blogs.json"),
                
            ]
        ),
        .testTarget(
            name: "BlogTests",
            dependencies: [
                "Blog",
                 //.product(name: "Factory", package: "Factory"),
                // .product(name: "SmartNet", package: "SmartNet")
                 
            ],
            resources: [
                .process("Resources/mock_blog_posts.json")
                
            ]
        ),
    ]
    
)
