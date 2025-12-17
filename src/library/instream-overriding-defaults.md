# Instream: Override defaults

To change some predefined In-Stream settings:

```swift
let tag = AdPlayer.getTag(...)
let controller = tag.newInReadController {
    // Custom content cmsId will play instead the video defined for the TAG
    $0.contentOverride = .init(cmsId: "<custom video id>")

    // Only Content Video will play
    $0.disableVideoAds = true
}

// Attach new controller to the placement view
let placement = AdPlacementView()
placement.attachController(controller)

```
