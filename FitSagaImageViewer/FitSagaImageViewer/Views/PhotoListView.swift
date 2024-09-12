import SwiftUI

struct PhotoListView: View {
    @StateObject private var viewModel = PhotoViewModel()
    @State private var selectedPhoto: Photo?
    @State private var isDetailViewActive = false
    @State private var searchText = ""

    private let columns = [
        GridItem(.adaptive(minimum: 120)) // Adaptive layout for different screen sizes
    ]
    
    private var filteredPhotos: [Photo] {
        let lowercasedSearchText = searchText
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()

        guard !lowercasedSearchText.isEmpty else {
            return viewModel.photos
        }

        return viewModel.photos.filter { photo in
            let lowercasedName = photo.user.name.lowercased()
            let lowercasedDescription = photo.description?.lowercased() ?? ""

            return lowercasedName.localizedStandardContains(lowercasedSearchText) ||
                   lowercasedDescription.localizedStandardContains(lowercasedSearchText)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onClear: {
                    searchText = ""
                })
                .padding(.top, 10)
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    GeometryReader { geometry in
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(filteredPhotos) { photo in
                                    PhotoGridItem(photo: photo) {
                                        selectedPhoto = photo
                                        isDetailViewActive = true
                                    }
                                    .frame(width: (geometry.size.width / CGFloat(columns.count)) - 20)
                                    .onAppear {
                                      
                                        if photo == filteredPhotos.last {
                                            viewModel.fetchPhotos()
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    .navigationTitle("Unsplash Photos")
                    .navigationBarItems(trailing: NavigationLink(
                        destination: FavoritesView(viewModel: viewModel),
                        label: {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    ))
                }
            }
            .onAppear {
                viewModel.fetchPhotos()
            }
            .background(
                NavigationLink(
                    destination: PhotoDetailView(photo: selectedPhoto, viewModel: viewModel),
                    isActive: $isDetailViewActive,
                    label: { EmptyView() }
                )
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
