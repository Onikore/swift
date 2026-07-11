import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "swift")
                .font(.system(size: 64))
                .foregroundStyle(.orange)
            Text("Hello, Builder!")
                .font(.title)
            Text("Tapped \(count) times")
            Button("Tap me") { count += 1 }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
