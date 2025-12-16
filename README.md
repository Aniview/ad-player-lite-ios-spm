# AdPlayerLite iOS

## Requirements
 * iOS >= 15.0
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

### Display AdPlayer placement

AdPlacementView its width to be defined.  
The height is managed automatically (it maintains intrinsicContentSize)

Example:
```java
import AdPlayerLite
import Combine
import UIKit

class YourViewController: UIViewController {
    private var bag: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let controller = AdPlayer
            .getTag(pubId: "<your pubId>", tagId: "<your tagId>")
            .newInReadController()

        let placement = AdPlacementView()
        placement.attachController(controller)
        placement.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placement)
        NSLayoutConstraint.activate([
            placement.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placement.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            placement.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor)
        ])

        controller.eventsPublisher.sink { event in
            print("Ad event: \(event)")
        }.store(in: &bag)

        controller.statePublisher.sink { state in
            print("Ad state: \(state)")
        }.store(in: &bag)
    }
}
```

## Sample project
[AdPlayerLiteSample](https://github.com/Aniview/ad-player-lite-ios-example)

## Additional Resources
More details can be found on: https://aniview.github.io/ad-player-lite-ios-spm
