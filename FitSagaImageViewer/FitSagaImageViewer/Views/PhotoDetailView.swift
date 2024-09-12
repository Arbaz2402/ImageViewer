import SwiftUI

struct PhotoDetailView: View {
    let photo: Photo?
    @ObservedObject var viewModel: PhotoViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if let photo = photo {
                        // Large photo with a fixed size and padding
                        AsyncImage(url: URL(string: photo.urls.regular)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.60)
                                    .clipped()
                                    .padding(.top, 20) 
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.60)
                                    .clipped()
                                    .padding(.top, 20)
                            case .failure:
                                Text("Error loading image")
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.75)
                                    .background(Color.gray)
                                    .padding(.top, 20)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        // Photographer name
                        HStack {
                            Text("Photographer: \(photo.user.name)")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.toggleFavorite(photo: photo)
                            }) {
                                Image(systemName: viewModel.favoritePhotos.contains(where: { $0.id == photo.id }) ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                    .font(.title2)
                            }
                            .padding(.trailing, 20)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        
                        // Description
                        if let description = photo.description, !description.isEmpty {
                            Text("Description: \(description)")
                                .font(.body)
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                        } else {
                            Text("No description available")
                                .font(.body)
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                        }
                        
                    } else {
                        Text("No photo selected")
                            .font(.title)
                            .padding()
                    }
                }
                
            }
            
        }.navigationTitle("Photo Details")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white.ignoresSafeArea())
    }
}
