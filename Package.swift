// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExpressionParser",
    platforms: [
        .macOS("15.0"), .iOS("18.0"), .macCatalyst("15.0"), .tvOS("18.0"),
        .watchOS("11.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ExpressionParser",
            targets: ["ExpressionParser"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/mgriebling/BigDecimal.git", from: "3.0.0"),
        // .package(url: "https://github.com/mgriebling/UInt128.git", from: "3.0.0")
        // .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ExpressionParser",
            dependencies: ["BigDecimal"]
        ),
        .testTarget(
            name: "ExpressionParserTests",
            dependencies: ["ExpressionParser"]),
    ]
)
