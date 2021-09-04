import SwiftUI

private enum Config {
  enum Image {
    static let width: CGFloat = 100
  }
}

struct BeerTopSectionView: View {
  let imageURL: URL
  let description: String

  var body: some View {
    HStack {
      AsyncImage(url: imageURL) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .frame(width: Config.Image.width, height: Config.Image.width)
        case let .success(image):
          image.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Config.Image.width)
            .padding()
            .accessibilityHidden(false) // Image doesn't add value for people who can't see.

        case .failure:
          Image(systemName: "fire")
        @unknown default:
          ProgressView()
        }
      }

      VStack {
        Text(description)
          .padding()
      }
    }
  }
}

struct BeerTopSectionView_Previews: PreviewProvider {
  static var previews: some View {
    BeerTopSectionView(imageURL: URL(string: "www.hello.com")!, description: "")
  }
}
