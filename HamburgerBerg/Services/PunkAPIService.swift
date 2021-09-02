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

  func fetchBeers() -> AnyPublisher<[Beer], AFError> {
    beerLog("Start to fetch list of beer", .networking, .info)

    guard let url =  Endpoint(path: "/beers", queryItems: []).url  else {
      fatalError("App is ambiguous because of invalid beers url endpoint.")
    }

    return AF.request(url, method: .get)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])
      .publishDecodable(type: [Beer].self)
      .value()
  }
}

