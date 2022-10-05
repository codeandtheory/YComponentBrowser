// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "YComponentBrowser",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "YComponentBrowser",
            targets: ["YComponentBrowser"]
        )
    ],
    targets: [
        .target(
            name: "YComponentBrowser",
            dependencies: []
        ),
        .testTarget(
            name: "YComponentBrowserTests",
            dependencies: ["YComponentBrowser"]
        )
    ]
)
