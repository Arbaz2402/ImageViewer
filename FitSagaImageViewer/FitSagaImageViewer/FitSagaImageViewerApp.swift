import SwiftUI

@main
struct MyApp: App {
    @StateObject private var viewModel = PhotoViewModel()

    var body: some Scene {
        WindowGroup {
            PhotoListView()
                .environmentObject(viewModel)
        }
    }
}
