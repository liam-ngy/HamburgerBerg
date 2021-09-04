import SwiftUI

private enum Config {
  enum Space {
    static let padding: CGFloat = 16
  }
}

struct BeerView: View {
  let viewModel: BeerViewModel

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        BeerTopSectionView(imageURL: viewModel.imageURL, description: viewModel.description)
        
        BeerDetailsView(
          formattedAbv: viewModel.formattedAbv,
          formattedFirstBrewed: viewModel.formattedFirstBrewed
        )
          .padding(.leading, Config.Space.padding)

        FoodsPairingView(foodPairing: viewModel.foodPairing)
          .padding(.leading, Config.Space.padding)

      }

    }
    .navigationTitle(Text(viewModel.title))
  }
}

struct BeerView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = BeerViewModel(model: .stub)
    BeerView(viewModel: viewModel)
  }
}
