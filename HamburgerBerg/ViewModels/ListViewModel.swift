import Foundation
import SwiftUI
import Observation

@MainActor
@Observable
final class ListViewModel {
  // MARK: - Properties
  private let punkAPIService: PunkServiceProtocol

  private(set) var beers: Result<[BeerViewModel], NetworkBeerError> = .success([])

  // MARK: - Initializer

  init(service: PunkServiceProtocol = PunkAPIService()) {
    self.punkAPIService = service
  }

  // MARK: - Methods

  func fetchBeers() async {
    beerLog("Beers are being refetched", .networking, .info)
    self.beers = await punkAPIService.fetchBeers().map { $0.map(BeerViewModel.init) }
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

