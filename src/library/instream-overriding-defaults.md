# Instream: Overriding defaults

To change some predefined In-Stream settings:

```swift
let tag = AdPlayer.getTag(...)
let controller = tag.newInReadController {
    // override in-stream content by using CmsId
    $0.contentOverride = .cmsId("<custom video cms id>")

    // override in-stream content by using direct video url
    $0.contentOverride = .directUrls(["<custom video URL>"])

    // disable in-stream video ads
    $0.disableVideoAds = true
}

// Attach new controller to the placement view
let placement = AdPlacementView()
placement.attachController(controller)

```
