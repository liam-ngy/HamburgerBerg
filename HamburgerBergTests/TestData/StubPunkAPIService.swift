import Foundation
import Combine
import Alamofire
@testable import HamburgerBerg

final class StubPunkAPIService: PunkServiceProtocol {
  let isSuccess: Bool

  init(isSuccess: Bool) {
    self.isSuccess = isSuccess
  }

  func fetchBeers() -> AnyPublisher<[Beer], AFError> {
    let subject = CurrentValueSubject<[Beer], AFError>([])

    if isSuccess {
      subject.send(.stub)
    } else {
      subject.send(completion: .failure(.explicitlyCancelled))
    }

    return subject.eraseToAnyPublisher()
  }
}

extension PunkServiceProtocol where Self == StubPunkAPIService {
  static func stubPunk(isSuccess: Bool) -> StubPunkAPIService {
    StubPunkAPIService(isSuccess: isSuccess)
  }
}

extension Collection where Element == Beer {
  static var stub: [Beer] {
    let beer1 = Beer(
      id: 1,
      name: "Thailand",
      tagline: "Sawadi",
      firstBrewed: .distantPast,
      description: "blabla",
      abv: 14.3,
      foodPairing: ["None", "Food", "Summerrolls"],
      imageURL: URL(string: "https://www.thailand.com")!
    )

    let beer2 = Beer(
      id: 1,
      name: "Japan",
      tagline: "Konichiwa",
      firstBrewed: .distantPast,
      description: "blabla",
      abv: 12.3,
      foodPairing: ["Rice", "Food", "Summerrolls"],
      imageURL: URL(string: "https://www.japan.com")!
    )

    let beer3 = Beer(
      id: 1,
      name: "Germany",
      tagline: "Sauerkraut",
      firstBrewed: .distantPast,
      description: "blabla",
      abv: 13.3,
      foodPairing: ["Rice", "Food", "Summerrolls"],
      imageURL: URL(string: "https://www.germany.com")!
    )

    return [beer1, beer2, beer3]
  }
}

extension Collection where Element == BeerViewModel {
  static var stub: [BeerViewModel] {
    let beers: [Beer] = .stub
    return beers.map { BeerViewModel(model: $0) }
  }
}
