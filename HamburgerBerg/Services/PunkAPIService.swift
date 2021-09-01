import Alamofire
import Combine

final class PunkAPIService {
  private let beersURL = "https://api.punkapi.com/v2/beers"

  func fetchBeers() -> Future<Void, Never> {
    return Future { promise in
      promise(.success(()))
    }
  }
}

