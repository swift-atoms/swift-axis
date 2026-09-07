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
        .library(name: "Axis", targets: ["Axis"]),

        .library(name: "Axis Foundation Integration", targets: ["Axis Foundation Integration"]),
        .library(name: "Axis Test Support", targets: ["Axis Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-cardinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-equation.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-comparison.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-finite.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ordinal.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Axis",
            dependencies: [
                .product(name: "Equation", package: "swift-equation"),
                .product(name: "Hash", package: "swift-hash"),
                .product(name: "Comparison", package: "swift-comparison"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Finite", package: "swift-finite"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ],
            path: "Sources/Axis"
        ),
        
        .target(
            name: "Axis Foundation Integration",
            dependencies: [
                .target(name: "Axis"),
            ],
            path: "Sources/Axis Foundation Integration"
        ),
        .target(
            name: "Axis Test Support",
            dependencies: [
                .target(name: "Axis"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Axis Tests",
            dependencies: [
                .target(name: "Axis"),
                .product(name: "Equation", package: "swift-equation"),
                .product(name: "Hash", package: "swift-hash"),
                .product(name: "Comparison", package: "swift-comparison"),
                .target(name: "Axis Test Support"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Finite", package: "swift-finite"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .target(name: "Axis Foundation Integration"),
            ],
            path: "Tests/Axis Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
