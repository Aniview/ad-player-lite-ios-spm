# Launching Interstitials

Unlike in-read mode, interstitials don't require any placement view. Instead the are always displayed in fullscreen. Interstitials, unlike regular fullscreen, will also be automatically closed after the first video finishes.

Here is a basic example:
```swift
AdPlayer.showInterstitial(pubId: pubId, tagId: tagId) {
    // Interstitial has been dismissed
}
```

Also, you might want to customise Interstitial's behaviour:

```swift
let config = InterstitialConfiguration(
    stalledVideoTimeout: 2.0,
    showCloseButtonAfterAdDuration: true
)
AdPlayer.showInterstitial(pubId: pubId, tagId: tagId, configuration: config) { }
```
