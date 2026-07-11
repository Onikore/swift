# SwiftUI intro

SwiftUI is Apple's UI framework — it only runs/renders/previews on macOS (Xcode) or on
an actual iOS device. It cannot be compiled or previewed with the Windows Swift toolchain,
because the SwiftUI runtime itself isn't part of the open-source Swift distribution.

The reference code below is what a minimal SwiftUI app looks like. To actually see it
running, it needs to live inside a real Xcode project and be built via `builder`
(see [projects/README.md](../../projects/README.md)) using GitHub Actions, or on a Mac.

```swift
import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(count)")
                .font(.title)
            Button("Increment") { count += 1 }
        }
        .padding()
    }
}
```

Concepts to learn here (read the code, don't expect to run it locally):
- `@State` — local mutable view state
- `View` protocol and `body` — declarative UI description
- `VStack`/`HStack`/`ZStack` — layout containers
- `@Binding`, `@ObservedObject`, `@EnvironmentObject` — data flow between views
