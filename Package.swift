// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-axis",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [

        .library(
            name: "Axis Primitive",
            targets: ["Axis Primitive"]
        ),

        .library(
            name: "Axis Equation",
            targets: ["Axis Equation"]
        ),
        .library(
            name: "Axis Hash",
            targets: ["Axis Hash"]
        ),
        .library(
            name: "Axis Comparison",
            targets: ["Axis Comparison"]
        ),
        .library(
            name: "Axis Enumerable",
            targets: ["Axis Enumerable"]
        ),

        .library(
            name: "Axis",
            targets: ["Axis"]
        ),

        .library(
            name: "Axis Test Support",
            targets: ["Axis Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-equation.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-comparison.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-finite.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ordinal.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(
            name: "Axis Primitive",
            dependencies: []
        ),

        .target(
            name: "Axis Equation",
            dependencies: [
                "Axis Primitive",
                .product(name: "Equation", package: "swift-equation"),
            ]
        ),
        .target(
            name: "Axis Hash",
            dependencies: [
                "Axis Primitive",
                .product(name: "Hash", package: "swift-hash"),
            ]
        ),
        .target(
            name: "Axis Comparison",
            dependencies: [
                "Axis Primitive",
                .product(name: "Comparison", package: "swift-comparison"),
            ]
        ),

        .target(
            name: "Axis Enumerable",
            dependencies: [
                "Axis Primitive",
                .product(name: "Finite", package: "swift-finite"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ]
        ),

        .target(
            name: "Axis",
            dependencies: [
                "Axis Primitive",
                "Axis Equation",
                "Axis Hash",
                "Axis Comparison",
                "Axis Enumerable",
            ]
        ),

        .target(
            name: "Axis Test Support",
            dependencies: [
                "Axis",
                .product(
                    name: "Ordinal Test Support",
                    package: "swift-ordinal"
                ),
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "Axis Tests",
            dependencies: [
                "Axis",
                "Axis Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
