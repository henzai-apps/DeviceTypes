// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeviceTypes",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "DeviceTypes",
            targets: [
                "DeviceTypes"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kareman/SwiftShell", from: "5.1.0"),
    ],
    targets: [
        .target(
            name: "DeviceTypes",
            dependencies: []),
        .executableTarget(
            name: "DeviceTypesGen",
            dependencies: [
                "SwiftShell",
            ]
        ),
        .testTarget(
            name: "DeviceTypesTests",
            dependencies: [
                "DeviceTypes"
            ]
        ),
        .testTarget(
            name: "DeviceTypesGenTests",
            dependencies: [
                "DeviceTypesGen"
            ]
        ),
    ]
)
