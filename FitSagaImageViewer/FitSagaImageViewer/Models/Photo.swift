import Foundation

struct Photo: Identifiable, Codable, Equatable,Hashable {
    let id: String
    let urls: PhotoURLs
    let user: PhotoUser
    let description: String?
    
    struct PhotoURLs: Codable, Equatable,Hashable {
        let small: String
        let regular: String
    }

    struct PhotoUser: Codable,Equatable,Hashable {
        let name: String
    }
}
