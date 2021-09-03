import Alamofire
import Combine
import os.log
import Foundation

// Mock Alamofire response
// https://github.com/WeTransfer/Mocker#alamofire


protocol PunkServiceProtocol {
  func fetchBeers() -> AnyPublisher<[Beer], AFError>
}

final class PunkAPIService: PunkServiceProtocol {
  @discardableResult
  func fetchBeers() -> AnyPublisher<[Beer], AFError> {
    beerLog("Start to fetch list of beer", .networking, .info)

    guard let url =  Endpoint(path: [.beers], queryItems: []).url  else {
      fatalError("App is ambiguous because of invalid beers url endpoint.")
    }

    return AF.request(url, method: .get)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])
      .publishDecodable(type: [Beer].self)
      .value()
  }
}

