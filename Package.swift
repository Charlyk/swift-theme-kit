// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftThemeKit",
    platforms: [
        .iOS(.v14),            // Minimum SwiftUI version
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "SwiftThemeKit",
            targets: ["SwiftThemeKit"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftThemeKit",
            dependencies: [],
            path: "Sources/SwiftThemeKit",
            resources: [
                .process("Resources/Fonts")
            ]
        ),
        .testTarget(
            name: "SwiftThemeKitTests",
            dependencies: ["SwiftThemeKit"],
            path: "Tests/SwiftThemeKitTests"
        ),
    ]
)
