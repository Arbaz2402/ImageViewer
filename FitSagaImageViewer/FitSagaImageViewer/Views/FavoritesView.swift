import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: PhotoViewModel
    @State private var selectedPhoto: Photo?
    @State private var isDetailViewActive = false

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.favoritePhotos.prefix(12)) { photo in
                    PhotoGridItem(photo: photo) {
                        selectedPhoto = photo
                        isDetailViewActive = true
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white.ignoresSafeArea())
        .background(
            NavigationLink(
                destination: selectedPhoto.map { PhotoDetailView(photo: $0, viewModel: viewModel) },
                isActive: $isDetailViewActive,
                label: { EmptyView() }
            )
        )
        
    }
}
