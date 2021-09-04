import SwiftUI

private enum Config {
  enum Image {
    static let square: CGFloat = 100
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


struct BeerView: View {
  let viewModel: BeerViewModel

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        HStack {
          AsyncImage(url: viewModel.imageURL) { phase in
            switch phase {
            case .empty:
              ProgressView()
                .frame(width: Config.Image.square, height: Config.Image.square)
            case let .success(image):
              image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Config.Image.square)
                .padding()
                .accessibilityHidden(false) // Image doesn't add value for people who can't see.

            case .failure:
              Image(systemName: "fire")
            @unknown default:
              ProgressView()
            }
          }

          VStack {
            Text(viewModel.description)
              .padding()
          }
        }

        Group {
          Text(
            "Details",
            comment: "Based on the beer it can be paired of with some foods"
          )
            .font(Font.title).bold()
            .foregroundStyle(.secondary)

          Text("**abv:** \(viewModel.formattedAbv)")
            .lineLimit(Config.Text.lineNumbers)


          Text("**First time brewed:** \(viewModel.formattedFirstBrewed)")
            .lineLimit(Config.Text.lineNumbers)        }
        .padding(.leading, 16)

        Group {
          Text(
            "Food pairing",
            comment: "Based on the beer it can be paired of with some foods"
          )
            .font(Font.title).bold()
            .foregroundStyle(.secondary)

          ForEach(values: viewModel.foodPairing) {
            Text($0)
          }
        }
        .padding(.leading, 16)

      }

    }.navigationTitle(Text(viewModel.title))
  }
}

struct BeerView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = BeerViewModel(model: .stub)
    BeerView(viewModel: viewModel)
  }
}
