# DeviceTypes

[![Generate](https://github.com/noppefoxwolf/DeviceTypes/actions/workflows/generate.yml/badge.svg?branch=main&event=schedule)](https://github.com/noppefoxwolf/DeviceTypes/actions/workflows/generate.yml)

`noppefoxwolf/DeviceTypes` is provide enum device names.

These device names are generated everyday using github actions.

Generated device names are depends on github actions environments.

https://github.com/actions/virtual-environments

# Installation

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/noppefoxwolf/DeviceTypes", branch: "main")
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

# License

DeviceTypes is available under the MIT license. See the LICENSE file for more info.
