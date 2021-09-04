import SwiftUI

private enum Config {
  enum Image {
    static let square: CGFloat = 64
  }
  enum Frame {
    static let height: CGFloat = 100
  }

  enum Text {
    static let lineNumbers: Int = 3
  }

  enum Space {
    static let distance: CGFloat = 16
  }
}

struct BeerRowView: View {
  let viewModel: BeerViewModel

  var body: some View {
    HStack {
      AsyncImage(url: viewModel.imageURL) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .frame(width: Config.Image.square, height: Config.Image.square)
        case let .success(image):
          image.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Config.Image.square, height: Config.Image.square)
            .accessibilityHidden(true) // Image doesn't add value for people who can't see.

        case .failure:
          Image(systemName: "fire")
        @unknown default:
          ProgressView()
        }
      }


      Spacer()
        .frame(width: Config.Space.distance, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

      VStack(alignment: .leading) {
        Text(viewModel.title)
          .font(.headline)

        Text(viewModel.tagline)
          .lineLimit(Config.Text.lineNumbers)
          .padding(.bottom, 8)

        Text("**abv:** \(viewModel.formattedAbv)")
          .font(.caption2)
          .lineLimit(Config.Text.lineNumbers)


        Text("**First time brewed:** \(viewModel.formattedFirstBrewed)")
          .font(.caption2)
          .lineLimit(Config.Text.lineNumbers)
      }

      Spacer()
    }
    .frame(minHeight: Config.Frame.height)
  }
}
