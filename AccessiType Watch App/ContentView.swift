import SwiftUI
import WatchKit

struct ContentView: View {
    @State private var crownRotation: Double = 0
    @State private var message: String = ""

    var body: some View {
        VStack {
            Text(message)
                .focusable(true)
                .digitalCrownRotation($crownRotation, from: -Double.infinity, through: Double.infinity, by: 1, sensitivity: .low, isContinuous: false)
                .onChange(of: crownRotation) { newValue in
                    if newValue > 0 {
                        message = "U"
                    } else if newValue < 0 {
                        message = "D"
                    }
                    crownRotation = 0 // Reset the crown rotation value
                }

            Button("Select") {
                message = "X"
            }
        }
    }
}
