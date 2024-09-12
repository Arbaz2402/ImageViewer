import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: PhotoViewModel

    var body: some View {
        PhotoListView()
            .environmentObject(viewModel) 
    }
}
