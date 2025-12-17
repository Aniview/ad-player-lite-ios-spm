// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let artifactVersion = "0.0.5"

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
            checksum: "15200c2f0fca31ca034f011ae032b3ac19e21c6e009aa20cdbf597a2065c5cf2"
        )
    ]
)
