// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let artifactVersion = "1.13.1"

let package = Package(
    name: "ad-player-lite-sources",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AdPlayerLite",
            targets: ["AdPlayerLiteTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", from: "3.24.0"),
        // OM SDK (Aniview partner build) — IAB doesn't publish it as an SPM package
        // itself (raw XCFramework only), so it's re-hosted behind its own wrapper package.
        .package(url: "https://github.com/Aniview/omsdk-ios-spm.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "AdPlayerLiteTarget",
            dependencies: [
                .target(name: "AdPlayerLite"),
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios"),
                // Same treatment as GoogleInteractiveMediaAds above: it's a dynamic
                // framework, not embedded inside AdPlayerLite.xcframework's own zip
                // (make_artifacts.sh only zips AdPlayerLite.xcframework), so host apps
                // need it declared here to be pulled in automatically.
                .product(name: "OMSDKKit", package: "omsdk-ios-spm")
            ],
            path: "PlaceHolder"
        ),
        .binaryTarget(
            name: "AdPlayerLite",
            url:
                "https://github.com/Aniview/ad-player-lite-ios-spm/releases/download/v\(artifactVersion)/AdPlayerLite.zip",
            checksum: "97281fc9d8b50ee9c37b9de1ff9117098b62b3f9ca892cbb3b8c48e02b09fbf4"
        )
    ]
)
