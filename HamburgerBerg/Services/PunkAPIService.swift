import Alamofire
import Combine
import os.log

//protocol PunkAPI {
//  func fetchBeers() -> AnyPublisher<[Beer], AFError>
//}

final class PunkAPIService {
  private let beersURL = "https://api.punkapi.com/v2/beers"

//  func fetchBeers() -> AnyPublisher<[Beer], AFError> {
//    os_log("Start to fetch list of beer", type: .info)
//
//    return AF.request(self.beersURL, method: .get)
//      .validate(statusCode: 200..<300)
//      .validate(contentType: ["application/json"])
//      .publishDecodable(type: [Beer].self)
//      .value()
//  }

  func fetchBeers() {
    os_log("Start to fetch list of beer", type: .info)

    AF.request(self.beersURL, method: .get)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])
      .responseJSON { response in
        print(response)
      }
  }
}

