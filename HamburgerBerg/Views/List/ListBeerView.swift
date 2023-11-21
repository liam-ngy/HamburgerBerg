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
          NavigationLink {
            BeerView(viewModel: beer)
          } label: {
            BeerRowView(viewModel: beer)
              .accessibilityHint(Text("Detailed Button Action"))
          }
        }
        // Beer will be fetched when user is on the list page.
        // That means if the user on details page and coming back, beer will be refetched.
        // Optimal solution: Only fetch one
//        .onAppear {viewModel.fetchBeers() }
        .task { await viewModel.fetchBeers() }
        .refreshable{ Task { await viewModel.fetchBeers() } }
        .navigationTitle(Text("List of beer"))
      }
    case .failure:
      Text("Something went wrong")
        .foregroundColor(.red)
    }
  }

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListBeerView(viewModel: ListViewModel())
  }
}
