// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let artifactVersion = "1.0.0"

let package = Package(
    name: "ad-player-lite-sources",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AdPlayerLite",
            targets: ["AdPlayerLiteTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", from: "3.24.0")
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
            checksum: "e35a0106f1fe04cf55088a76f7ce1e1aed9cfc9687d29fafc0f95e3a707a5f20"
        )
    ]
)
