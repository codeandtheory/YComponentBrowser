// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YComponentBrowser",
    platforms: [
        // The minimum version for platforms supported by the package.
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "YComponentBrowser",
            targets: ["YComponentBrowser"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.47.1/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "82ef90b7d76b02e41edd73423687d9cedf0bb9849dcbedad8df3a461e5a7b555"
        ),
        .plugin(
            name: "SwiftLint",
            capability: .buildTool(),
            dependencies: ["SwiftLintBinary"]
        ),
        .target(
            name: "YComponentBrowser",
            dependencies: [],
            plugins: ["SwiftLint"]
        ),
        .testTarget(
            name: "YComponentBrowserTests",
            dependencies: ["YComponentBrowser"],
            plugins: ["SwiftLint"]
        )
    ]
)
