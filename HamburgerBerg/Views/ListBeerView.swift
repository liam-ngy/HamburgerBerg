import SwiftUI
import Combine

struct ListBeerView: View {
  @StateObject
  var viewModel: ListViewModel

  var body: some View {
    List(viewModel.beers, id: \.id) { beer in
      BeerRowView(
        title: beer.name,
        description: beer.description,
        imageURL: beer.imageURL
      )
    }
    .refreshable {
      viewModel.refetchBeers()
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListBeerView(viewModel: ListViewModel())
  }
}
