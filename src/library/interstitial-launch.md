# Launching Interstitials

Unlike in-read mode, interstitials don't require any placement view - it's presented as a modal fullscreen UIViewController.  
Interstitials will be automatically closed once the first video finishes.

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
