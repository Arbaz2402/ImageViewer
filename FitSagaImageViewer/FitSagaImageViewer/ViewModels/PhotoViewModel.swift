import SwiftUI

class PhotoViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    @Published var favoritePhotos: [Photo] = []
    @Published var isLoading = false
    @Published var error: Error?

    private let service = UnsplashService()
    private var currentPage = 1
    private var isFetching = false
    
    func fetchPhotos() {
        guard !isFetching else { return }
        isFetching = true
        isLoading = true
        
        service.fetchPhotos(page: currentPage) { [weak self] photos, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                self?.isFetching = false
                
                if let error = error {
                    self?.error = error
                } else {
                    if let newPhotos = photos {
                        self?.photos.append(contentsOf: newPhotos)
                        self?.currentPage += 1
                    }
                }
            }
        }
    }
    
    func toggleFavorite(photo: Photo) {
        if let index = favoritePhotos.firstIndex(where: { $0.id == photo.id }) {
            favoritePhotos.remove(at: index)
        } else {
            favoritePhotos.append(photo)
        }
    }
}
