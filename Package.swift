// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftThemeKit",
    platforms: [
        .iOS(.v15),            // Minimum SwiftUI version
        .macOS(.v12),
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
            path: "Sources/SwiftThemeKit"
        ),
        .testTarget(
            name: "SwiftThemeKitTests",
            dependencies: ["SwiftThemeKit"],
            path: "Tests/SwiftThemeKitTests"
        ),
    ]
)
