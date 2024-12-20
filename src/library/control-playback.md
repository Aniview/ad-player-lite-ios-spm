# AdPlayerController

The `AdPlayerController` is a key component of the AdPlayerLite SDK, designed to manage and control video playback within the `AdPlacementView`. This guide provides an overview of its features and how to use it effectively.

## Accessing the AdPlayerController

You can obtain an `AdPlayerController` instance from an `AdPlacementView` object:

```swift
let placement = AdPlacementView(pubId: pubId, tagId: tagId)
let controller = placement.controller
```

The `AdPlayerController` is used to interact with the player, observe its state, and control playback.

## Features

### Player State
- **Property**: `state`
  - Type: `AdPlayerLite.AdPlayerState`
  - Description: Represents the current playing state of the player.

- **Publisher**: `statePublisher`
  - Type: `AnyPublisher<AdPlayerLite.AdPlayerState, Never>`
  - Description: Allows observation of the playing state over time.

### Player Events
- **Publisher**: `eventsPublisher`
  - Type: `AnyPublisher<AdPlayerLite.AdPlayerEvent, Never>`
  - Description: Emits player events as they occur.

### Current Playing Content
- **Property**: `content`
  - Type: `AdPlayerLite.AdPlayerContent?`
  - Description: The currently playing content.

- **Publisher**: `contentPublisher`
  - Type: `AnyPublisher<AdPlayerLite.AdPlayerContent?, Never>`
  - Description: Allows observation of the currently playing content.

### Content Playlist
- **Property**: `playlist`
  - Type: `[AdPlayerLite.AdPlayerContent]`
  - Description: The content playlist managed by the player.

- **Publisher**: `playlistPublisher`
  - Type: `AnyPublisher<[AdPlayerLite.AdPlayerContent], Never>`
  - Description: Allows observation of the content playlist.

## Controlling Playback

### Basic Controls
- **Pause Playback**: `pause()`
  - Pauses the player if it is currently playing.

- **Resume Playback**: `resume()`
  - Resumes playback if the player is paused.

- **Skip Ad**: `skipAd()`
  - Skips the currently playing ad, if any.

### Fullscreen Mode
- **Toggle Fullscreen**: `toggleFullscreen()`
  - Moves the player to or from fullscreen mode.

### Content Navigation
- **Play Next Content**: `playNextContent()`
  - Plays the next content in the playlist if available.

- **Play Previous Content**: `playPrevContent()`
  - Plays the previous content in the playlist if available.

- **Play Content by Index**: `playContentByIndex(_ index: Int)`
  - Plays the content at the specified index in the playlist.

## Playback Information

### Ads
- **Ready Ads Count**: `getReadyAdsCount() async -> Int`
  - Returns the number of ads ready to be displayed but not yet shown (outstream only).

### Playback Positions and Durations
- **Ad Position**: `getAdPosition() async -> TimeInterval`
  - Retrieves the current position of the ad being played.

- **Ad Duration**: `getAdDuration() async -> TimeInterval`
  - Retrieves the total duration of the ad being played.

- **Content Position**: `getContentPosition() async -> TimeInterval`
  - Retrieves the current position of the playing content.

- **Content Duration**: `getContentDuration() async -> TimeInterval`
  - Retrieves the total duration of the playing content.

## Observing Player State and Events
You can use the provided publishers to observe changes in the player's state, events, content, and playlist. This is particularly useful for updating the UI dynamically.

Example:

```swift
import Combine

var cancellables: Set<AnyCancellable> = []

controller.statePublisher
    .sink { state in
        print("Player state: \(state)")
    }
    .store(in: &cancellables)

controller.eventsPublisher
    .sink { event in
        print("Player event: \(event)")
    }
    .store(in: &cancellables)
```

## Best Practices
- Ensure to manage memory by storing publishers in a `Set<AnyCancellable>`.
- Use async methods like `getAdPosition` or `getContentDuration` to retrieve information when needed.
- Leverage the `statePublisher` and `eventsPublisher` for real-time updates and debugging.

## Conclusion
The `AdPlayerController` provides comprehensive control over the playback of ads and content within the AdPlayerLite SDK. By understanding its features and using the provided methods and publishers, you can build a seamless and interactive video ad experience.

