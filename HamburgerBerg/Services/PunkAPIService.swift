import Alamofire
import Combine
import os.log
import Foundation

//protocol PunkAPI {
//  func fetchBeers() -> AnyPublisher<[Beer], AFError>
//}

final class PunkAPIService {
  static var decoder: JSONDecoder {
    let decoder = JSONDecoder()
    return decoder
  }
  private let beersURL = "https://api.punkapi.com/v2/beers"

  func fetchBeers() -> AnyPublisher<[Beer], AFError> {
    beerLog("Start to fetch list of beer", .networking, .info)

    return AF.request(self.beersURL, method: .get)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])
      .publishDecodable(type: [Beer].self)
      .value()
  }
}

