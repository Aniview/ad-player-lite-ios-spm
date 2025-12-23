# Player Controls Visibility

`Available since 1.3.0`

Visibility of some buttons displayed by the player can be changed if required.
## Changing Visibility
Each button can be hidden or shown:
```swift
let controller: AdPlayerController
controller.showPlayButton.value = false
controller.showSoundButton.value = false
controller.showFullscreenButton.value = false
```

## Visibility Default Values
Visibility states are represented as a nullable Bool? type.  
This allows seamless rollback to default value by passing a null value.
```swift
val controller: AdPlayerController
controller.showPlayButton.value = true        // visible
controller.showSoundButton.value = false      // invisible
controller.showFullscreenButton.value = nil  // default value
```
