import SwiftUI

private enum Config {
  enum Image {
    static let square: CGFloat = 100
  }
  enum Frame {
    static let height: CGFloat = 128
  }

  enum Text {
    static let lineNumbers: Int = 3
  }

  enum Space {
    static let distance: CGFloat = 16
  }
}

struct BeerRowView: View {
  let title: String
  let description: String
  let imageURL: URL?

  var body: some View {
    HStack {
      AsyncImage(url: imageURL) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .frame(width: Config.Image.square, height: Config.Image.square)
        case let .success(image):
          image.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Config.Image.square, height: Config.Image.square)
            .accessibilityHidden(false) // Image doesn't add value for people who can't see.

        case .failure:
          Image(systemName: "fire")
        @unknown default:
          ProgressView()
        }
      }


      Spacer()
        .frame(width: Config.Space.distance, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

      VStack(alignment: .leading) {
        Text(title)
          .font(.headline)

        Text(description)
          .font(.caption2)
          .lineLimit(Config.Text.lineNumbers)
      }

      Spacer()
    }
    .frame(height: Config.Frame.height)
  }
}

struct BeerRowView_Previews: PreviewProvider {
  static var previews: some View {
    BeerRowView(title: "Alsterwasser", description: "beer beer beer beer beer beer beer", imageURL: URL(string: "https://images.punkapi.com/v2/192.png"))
  }
}
