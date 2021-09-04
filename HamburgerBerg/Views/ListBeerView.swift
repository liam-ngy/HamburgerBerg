import SwiftUI
import Combine

struct ListBeerView: View {
  @StateObject
  var viewModel: ListViewModel

  var body: some View {
    switch viewModel.beers {
    case let .success(result):
      NavigationView {
        List(result, id: \.id) { beer in
          BeerRowView(
            title: beer.name,
            description: beer.description,
            imageURL: beer.imageURL
          )
        }
        .onAppear {viewModel.fetchBeers() }
        .refreshable{ viewModel.fetchBeers() }
        .navigationTitle(Text("Beers", comment: "Navigation title for full list of beer"))
      }
    case .failure:
      // TODO: Add failure case
      EmptyView()
    }
  }

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListBeerView(viewModel: .list)
  }
}
