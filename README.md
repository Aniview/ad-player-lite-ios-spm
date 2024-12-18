# AdPlayerLite iOS

## Requirements
 * iOS >= 14.0
 * Request tracking authorization
   https://developer.apple.com/documentation/apptrackingtransparency
 * Request GDPR (if applicable)  
 Obtain user consent for GDPR compliance if your app processes personal data from users in the European Economic Area (EEA). Ensure your app requests and records GDPR consent where required, particularly when handling personal data or serving personalized ads.
 https://developers.google.com/admob/ios/privacy/gdpr?utm_source=chatgpt.com


## Integration

### Initialise the SDK

AppDelegate.swift
```java
import AdPlayerLite

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let demoStoreURL = URL(string: Constants.storeURL)!
        AdPlayer.initSDK(storeUrl: demoStoreURL)
        return true
    }
}
```

### Request tracking authorization
It should be called before displaying Ads and when the app is visible.

For example, when your main view has appeared:
```java
import AppTrackingTransparency

@main
struct AdPlayerLiteQAApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
                .onAppear {
                    ATTrackingManager.requestTrackingAuthorization { status in
                        // handle status
                    }
                }
        }
    }
}
```
### Display AdPlayer placement

AdPlacementView its width to be defined.  
The height is managed automatically (it maintains intrinsicContentSize)

Example:
```java
import AdPlayerLite

class YourViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let placement = AdPlacementView(pubId: pubId, tagId: tagId)
        placement.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placement)
        NSLayoutConstraint.activate([
            placement.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placement.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            placement.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor)
        ])
    }
}
```

## Sample project
[AdPlayerLiteSample](https://github.com/Aniview/ad-player-lite-ios-example)

## Additional documentation
Additional documentation can be found on the [Wiki](https://github.com/Aniview/ad-player-lite-ios-spm/wiki)

## Author

https://aniview.com/

## License

All rights reserved to ANIVIEW LTD 2024
