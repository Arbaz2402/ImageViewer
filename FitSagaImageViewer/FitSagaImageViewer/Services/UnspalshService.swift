import Foundation

class UnsplashService {
    private let apiKey = "tPh91FDN2d8nWjm8MXV2T7qe7dEz_-hNn4O4avY4anc" 
    private let baseURL = "https://api.unsplash.com/photos"

    func fetchPhotos(page: Int, completion: @escaping ([Photo]?, Error?) -> Void) {
        let url = URL(string: "\(baseURL)?page=\(page)&per_page=20&client_id=\(apiKey)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, nil)
                return
            }

            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                completion(photos, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
