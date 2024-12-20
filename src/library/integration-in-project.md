To integrate the SDK into the project you might want to:
* Initialize SDK
* Request tracking authorization https://developer.apple.com/documentation/apptrackingtransparency
* Request GDPR (if applicable)
* Add the player to UI Layout  
Please refer to the [Displaying](displaying.md) guide for more details
* Ensure the player shows Ads / Content


## Initialize SDK

> **The SDK must be Initialized before it's used.**

> **Please provide the actual AppStore URL.  
> It's needed for proper ad impression tracking and affects monetization.**

```swift
import AdPlayerLite
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let storeURL = URL(string: Constants.storeURL)!
        AdPlayer.initSDK(storeUrl: storeURL)
        return true
    }
}
```
