// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftThemeKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "SwiftThemeKit",
            targets: ["SwiftThemeKit"]
        ),
    ],
    dependencies: [
        // Add ViewInspector here
        .package(url: "https://github.com/nalexn/ViewInspector", from: "0.10.1")
    ],
    targets: [
        .target(
            name: "SwiftThemeKit",
            dependencies: [],
            path: "Sources/SwiftThemeKit"
        ),
        .testTarget(
            name: "SwiftThemeKitTests",
            dependencies: [
                "SwiftThemeKit",
                .product(name: "ViewInspector", package: "ViewInspector")
            ],
            path: "Tests/SwiftThemeKitTests"
        ),
    ]
)
