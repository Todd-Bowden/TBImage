// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TBImage",
    platforms: [
        .macOS(.v13),
        .iOS(.v13),
        .tvOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TBImage",
            targets: ["TBImage"]),
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TBImage",
            dependencies: []),
        .testTarget(
            name: "TBImageTests",
            dependencies: ["TBImage"]),
    ]
)
