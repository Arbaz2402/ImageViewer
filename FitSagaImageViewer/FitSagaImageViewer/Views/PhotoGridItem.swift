import SwiftUI
struct PhotoGridItem: View {
    let photo: Photo
    var onSelect: () -> Void
    @State private var retryCount = 0

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: photo.urls.small), scale: 1, transaction: Transaction(animation: .default)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 160)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 160)
                        .clipped()
                case .failure:
                    VStack {
                        Text("Error loading image")
                            .font(.caption)
                            .foregroundColor(.red)
                        Button(action: {
                            retryCount += 1
                        }) {
                            Text("Retry")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                    }
                    .frame(width: 120, height: 160)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                @unknown default:
                    EmptyView()
                }
            }
            .id(retryCount) 
            Text(photo.user.name)
                .font(.caption)
                .lineLimit(1)
                .frame(width: 120)
        }
        .onTapGesture {
            onSelect()
        }
    }
}

