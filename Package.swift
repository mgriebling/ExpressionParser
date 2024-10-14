// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExpressionParser",
    platforms: [
		.macOS("13.3"), .iOS("16.4"), .macCatalyst("13.3"), .tvOS("16.4"),
		.watchOS("9.4")
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
            dependencies: ["BigDecimal"],
			exclude: ["Support/Copyright.frame", "Support/exp.atg", "Support/Parser.frame", "Support/Scanner.frame"]
        ),
        .testTarget(
            name: "ExpressionParserTests",
            dependencies: ["ExpressionParser"]),
    ]
)
