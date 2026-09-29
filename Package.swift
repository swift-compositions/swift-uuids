// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-uuids",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "UUIDs",
            targets: ["UUIDs"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-ietf/swift-rfc-4122.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-9562.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-random.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-darwin.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-linux.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-windows.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "UUIDs",
            dependencies: [
                .product(name: "RFC 4122", package: "swift-rfc-4122"),
                .product(name: "RFC 9562", package: "swift-rfc-9562"),
                .product(name: "Random", package: "swift-random"),
                .product(
                    name: "Darwin Kernel",
                    package: "swift-darwin",
                    condition: .when(platforms: [.macOS, .iOS, .tvOS, .watchOS, .visionOS])
                ),
                .product(
                    name: "Linux Kernel",
                    package: "swift-linux",
                    condition: .when(platforms: [.linux])
                ),
                .product(
                    name: "Windows Kernel",
                    package: "swift-windows",
                    condition: .when(platforms: [.windows])
                ),
            ]
        ),
        .testTarget(
            name: "UUIDs Tests",
            dependencies: [
                "UUIDs"
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
