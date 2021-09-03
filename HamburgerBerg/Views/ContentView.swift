import SwiftUI
import Combine

struct ContentView: View {
  @StateObject
  var viewModel: ListViewModel

  var body: some View {
//    ScrollView {
//      LazyVStack {
//        ForEach(viewModel.beers, id: \.id) { beer in
//          BeerRowView(title: beer.name, description: beer.description)
//        }
//      }
//      .refreshable {
//        print("Hello world")
//      }
//    }
        List(viewModel.beers, id: \.id) { beer in
          BeerRowView(title: beer.name, description: beer.description)
        }
      .refreshable {
        viewModel.refetchBeers()
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(viewModel: ListViewModel())
  }
}
