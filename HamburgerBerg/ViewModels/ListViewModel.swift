import Foundation
import Combine

final class ListViewModel: ObservableObject, ViewModelProtocol {
  // MARK: - Properties
  private var cancellables = Set<AnyCancellable>()
  private let punkAPIService: PunkServiceProtocol

  @Published
  private(set) var beers: [Beer] = []

  // MARK: - Initializer

  init(service: PunkServiceProtocol = PunkAPIService()) {
    self.punkAPIService = service

    fetchBeers()
  }

  // MARK: - Methods

  func refetchBeers() {
    beerLog("Beers are being refetched", .networking, .info)
    fetchBeers()
  }

  private func fetchBeers() {
    punkAPIService.fetchBeers().sink { completion in
      switch completion {
      case .finished: break
        // TODO: Show error message to user
      case let .failure(error): print(error)
      }
    } receiveValue: { [weak self] beers in
      self?.beers = beers
      beerLog("Beers successfully fetched", .networking, .info)
    }
    .store(in: &cancellables)
  }
}
