

## Project Overview
This iOS application fetches images from the Unsplash API, displays them in a grid layout, and presents the selected image in full screen along with metadata. The application is built using Swift and SwiftUI, adhering to best practices and avoiding third-party libraries.

## Features
- **Image Fetching:** Retrieves images from the Unsplash API.
- **Grid Layout:** Displays images in a responsive grid layout.
- **Full Screen Presentation:** Shows selected image in full screen with metadata.
- **Search Functionality:** Allows filtering images by photographer name or description.
- **Favorites:** Users can mark images as favorites and view them in a separate screen.

## Requirements
- Swift
- SwiftUI
- Unsplash API Key (Register and obtain an API key from Unsplash)

## Installation

1. **Clone the Repository:**
git clone https://github.com/Arbaz2402/ImageViewer.git

## Open the Project
Open `FitSaga.xcodeproj` in Xcode.

## Configure API Key
Replace `YOUR_UNSPLASH_API_KEY` in `PhotoViewModel.swift` with your actual Unsplash API key.

## Run the Application
Build and run the project in Xcode on the simulator or a physical device.

## Project Structure
- **PhotoListView.swift:** Displays a grid of images with search functionality.
- **PhotoDetailView.swift:** Presents the selected image in full screen with metadata.
- **FavoritesView.swift:** Shows a list of favorite images.
- **PhotoViewModel.swift:** Manages the fetching of images and the favorite state.
- **Photo.swift:** Data model for photo information.

## Usage
- **Navigating to Photo Details:** Tap on an image in the grid to view it in full screen with additional metadata.
- **Searching for Photos:** Use the search bar to filter images by photographer name or description.
- **Viewing Favorites:** Access the favorites screen via the star icon in the navigation bar.

## Known Issues
The application may experience layout issues in landscape orientation on some devices. This will be addressed in future updates.
## Screenshots

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/231f8faf-2d3b-4eef-afba-dfac68f2178a" alt="IMG-20240912-WA0006" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/d3b3ee51-a79b-4f55-915f-49bd49059c25" alt="IMG-20240912-WA0005" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/0b8d19bb-09ba-4ec4-97ae-78cb08324aa7" alt="IMG-20240912-WA0007" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/8f2c1a26-084d-4a57-a922-81fe174c95e5" alt="IMG-20240912-WA0008" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/c4130e2f-a7d3-493b-8449-f48ec8957063" alt="WhatsApp Image 2024-09-12 at 14 52 24_8737cb46" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/5ef06b36-23c3-418d-9370-aa5f42f9acbe" alt="IMG-20240912-WA0009" width="200"/></td>
  </tr>
</table>
