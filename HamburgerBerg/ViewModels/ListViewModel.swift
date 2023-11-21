import Foundation
import SwiftUI

@MainActor
final class ListViewModel: ObservableObject {
  // MARK: - Properties
  private let punkAPIService: PunkServiceProtocol

  @Published
  private(set) var beers: Result<[BeerViewModel], NetworkBeerError> = .success([])

  // MARK: - Initializer

  init(service: PunkServiceProtocol = PunkAPIService()) {
    self.punkAPIService = service
  }

  // MARK: - Methods

  func fetchBeers() async {
    beerLog("Beers are being refetched", .networking, .info)
    switch await punkAPIService.fetchBeers() {
    case .success(let beers):
      self.beers = .success(beers.map { BeerViewModel(model: $0) })
    case .failure(let error):
      self.beers = .failure(error)
    }
  }

  // MARK: - Accessibility


  private func announce(result: Int) {
    if UIAccessibility.isVoiceOverRunning {
      // Couldn't test it on real device. But it's a good practice to announce a message,
      // when something on the screen changed.
      UIAccessibility.post(notification: .announcement, argument: "\(result) are successfully fetched")
    }
  }
}
