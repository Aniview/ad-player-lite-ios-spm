# Content and Playlist

Both content and playlists are only available for insteam tags.

## Managing Playlist

Playlist contains list of content videos that are played one after the other. We can read current playlist like this:

```swift
let placement = AdPlacementView(pubId: pubId, tagId: tagId)
let controller = placement.controller

let playlist = controller.playlist.value // CAUTION: might not be loaded yet
print(playlist)
```

One important note here is that playlist is loaded by the library *asynchronously* and might not be available right after the controller is created. This might result in the above API returning empty playlist. It is advised, in most cases, for the application to track when playlist changes:

```swift
cancellable = controller.playlistPublisher.sink { [weak self] playlist in
  guard let self, playlist.count > 1 else { return }

  print(playlist)
}
```


## Currently Played Content

`AdPlayerController` can be used to track which content is currently playing:
```swift
let controller: AdPlayerController = ...

// reading current content
print("\(controller.content) is currently playing")

cancellable = controller.contentPublisher.sink { [weak self] content in
    guard let self else { return }

    print("\(content) is currently playing")
}
```

## Reading playback progress
```swift
let controller: AdPlayerController = ...

Task {
    let duration = await getDuration(isContent: isContent)
    let position = isContent ? await controller.getContentPosition() : await controller.getAdPosition()
    print("Current position \(position) / \(duration)")
}
```


## Choosing Content to Play

In order to play different video from the playlist we can use these functions:
```swift
let controller: AdPlayerController = ...

// play next video
controller.playNextContent()

// play previous video
controller.playPrevContent()

// play specific video
controller.playContentByIndex(3)
```

See also:  
[Time Indicator Example](https://github.com/Aniview/ad-player-lite-ios-example/blob/main/AdPlayerLiteSample/AdPlayerLiteSample/PlayerGui/PlayerTimeIndicator.swift)
