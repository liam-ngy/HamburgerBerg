//
//  ContentView.swift
//  HamburgerBerg
//
//  Created by Hoang Duc Nguyen on 01.09.21.
//

import SwiftUI
import Combine
import Alamofire

struct ContentView: View {
  var cancellables = Set<AnyCancellable>()
  let punkAPIService = PunkAPIService()
  
  init() {
//    punkAPIService.fetchBeers().sink { completion in
//      switch completion {
//      case .finished:
//        print("Finished")
//      case let .failure(error):
//        print(error.localizedDescription)
//      }
//    } receiveValue: { beers in
//      print(beers)
//    }
//    .store(in: &cancellables)

    punkAPIService.fetchBeers()
  }

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
