# Fullscreen

Normally, the player transitions to full-screen mode when the user taps the full-screen button in the player’s UI  (when the button is enabled).  
It’s also possible to present the player in full-screen mode programmatically.

## Fullscreen toggle
The following shows how to toggle full-screen mode programmatically:

```swift
let controller: AdPlayerController
controller.toggleFullscreen()
```

## Override default fullscreen configuration

```swift
let controller = AdPlayer
    .getTag(pubId: pubId, tagId: tagId)
    .newInReadController {
        $0.fullScreenConfiguration.ignoreSafeArea = true
        $0.fullScreenConfiguration.isCloseButtonEnabled = true
        $0.fullScreenConfiguration.insets = .zero
    }
```
