# DeviceTypes

# Installation

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/noppefoxwolf/DeviceTypes", from: "0.0.1")
    ]
)
```

# Usage

```diff
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
-            .previewDevice(PreviewDevice(rawValue: "iPhone X"))        
+            .previewDevice(.iPhoneX)
    }
}
```
