# Instream: Content override

To replace predefined In-Stream Content video:

```swift
let tag = AdPlayer.getTag(pubId: pubId, tagId: tagId)
let controller = tag.newInReadController {
    $0.contentOverride = .init(cmsId: "<custom video id>")
}

// Attach new controller to the placement view
let placement = AdPlacementView()
placement.attachController(controller)

```
