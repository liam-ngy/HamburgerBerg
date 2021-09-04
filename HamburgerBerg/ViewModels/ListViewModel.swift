import Foundation
import Combine
import Alamofire

final class ListViewModel: ObservableObject, ViewModelProtocol {
  // MARK: - Properties
  private var cancellables = Set<AnyCancellable>()
  private let punkAPIService: PunkServiceProtocol

  @Published
  private(set) var beers: Result<[Beer], AFError> = .success([])

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
      self?.beers = .success(beers)
    }
    .store(in: &cancellables)
  }
}
