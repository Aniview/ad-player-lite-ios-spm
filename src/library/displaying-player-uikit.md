Here is how to add the Player to the UIkit layout.  

## Adding AdPlacementView

```swift
import UIKit
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
> **Note:** The AdPlacementView's width must be defined.  

## Observing Player's Height Changes

> This part is optional as long as AdPlacementView resizes automatically.
> However it might be useful in order to implement expanding/collapsing animation

```swift
import UIKit
import AdPlayerLite

// viewDidLoad
let placement = AdPlacementView(pubId: pubId, tagId: tagId)
placement.delegate = self
//

extension YourViewController: AdPlacementViewLayoutDelegate {
    func onResize(height: CGFloat) {
        guard lastReportedHeight != height else {
            return
        }
        lastReportedHeight = height
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
```



See also: [Basic UI Kit Example](https://github.com/Aniview/ad-player-lite-ios-example/blob/main/AdPlayerLiteSample/AdPlayerLiteSample/UIKit/SimpleExampleVC.swift)
