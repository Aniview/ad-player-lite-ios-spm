// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let artifactVersion = "0.0.2"

let package = Package(
    name: "ad-player-lite-sources",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AdPlayerLite",
            targets: ["AdPlayerLiteTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", from: "3.23.0")
    ],
    targets: [
        .target(
            name: "AdPlayerLiteTarget",
            dependencies: [
                .target(name: "AdPlayerLite"),
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios")
            ],
            path: "PlaceHolder"
        ),
        .binaryTarget(
            name: "AdPlayerLite",
            url:
                "https://github.com/Aniview/ad-player-lite-ios-spm/releases/download/v\(artifactVersion)/AdPlayerLite.zip",
            checksum: "4e3478e8a656870752ea6b89229da61e2f46398f959618cff76b224619590ec4"
        )
    ]
)
