import Foundation
import Combine
import Alamofire

final class ListViewModel: ObservableObject, ViewModelProtocol {
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
        // TODO: Show error message to user
      case let .failure(error):
        beerLog("Beers failed to fetched with \(error)", .networking, .error)
        self?.beers = .failure(error)
      }
    } receiveValue: { [weak self] beers in
      beerLog("Beers successfully fetched", .networking, .info)

      // Note: O(n + m) where n and m are the list of beer.
      // The time complexity can be improved by sending single beer to the upstream and
      // transform it to a `BeerViewModel` but it's not necessary.
      let mappedViewModels = beers.map { BeerViewModel(model: $0) }
      self?.beers = .success(mappedViewModels)
    }
    .store(in: &cancellables)
  }
}
