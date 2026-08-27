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
            name: "Axis",
            targets: ["Axis"]
        ),
        .library(
            name: "Axis Standard Library Integration",
            targets: ["Axis Standard Library Integration"]
        ),
        .library(
            name: "Axis Apple Foundation Integration",
            targets: ["Axis Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Axis",
            dependencies: []
        ),
        .target(
            name: "Axis Standard Library Integration",
            dependencies: ["Axis"]
        ),
        .target(
            name: "Axis Apple Foundation Integration",
            dependencies: [
                "Axis",
                "Axis Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Axis Tests",
            dependencies: ["Axis"]
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
