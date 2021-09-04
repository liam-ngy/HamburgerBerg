import Foundation
import Combine
import Alamofire
import SwiftUI

final class ListViewModel: ObservableObject {
  // MARK: - Properties
  private var cancellables = Set<AnyCancellable>()
  private let punkAPIService: PunkServiceProtocol

  @Published
  private(set) var beers: Result<[BeerViewModel], AFError> = .success([])

  // MARK: - Initializer

  init(service: PunkServiceProtocol = PunkAPIService()) {
    self.punkAPIService = service
  }

  // MARK: - Methods

  func fetchBeers() {
    beerLog("Beers are being refetched", .networking, .info)
    punkAPIService.fetchBeers().sink { [weak self] completion in
      switch completion {
      case .finished: break
      case let .failure(error):
        beerLog("Beers failed to fetched with \(error)", .networking, .error)
        self?.beers = .failure(error)
      }
    } receiveValue: { [weak self] beers in
      beerLog("Beers successfully fetched", .networking, .info)
      self?.announce(result: beers.count)
      // Note: O(n + m) where n and m are the list of beer.
      // The time complexity can be improved by sending single beer to the upstream and
      // transform it to a `BeerViewModel` but it's not necessary.
      let mappedViewModels = beers.map { BeerViewModel(model: $0) }
      self?.beers = .success(mappedViewModels)
    }
    .store(in: &cancellables)
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
