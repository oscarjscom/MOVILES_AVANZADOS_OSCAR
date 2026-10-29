import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Boleta de ejemplo")
                    .font(.title)
                    .bold()
            }
            .padding()
        }
    }
}
