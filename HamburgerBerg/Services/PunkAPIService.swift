import Alamofire
import Combine
import os.log
import Foundation

// Mock Alamofire response
// https://github.com/WeTransfer/Mocker#alamofire


enum NetworkBeerError: Error {
  case network
  case invalidData
  case invalidDecoding
}

protocol PunkServiceProtocol {
  func fetchBeers() async -> Result<[Beer], NetworkBeerError>
}

struct PunkAPIService: PunkServiceProtocol {
  func fetchBeers() async -> Result<[Beer], NetworkBeerError> {
    guard let url = Endpoint(path: [.beers], queryItems: []).url  else {
      fatalError("App is ambiguous because of invalid beers url endpoint.")
    }
    
    guard let (data, _) = try? await URLSession.shared.data(from: url) else {
      return .failure(.invalidData)
    }
    
    guard let decodedResponse = try? JSONDecoder().decode([Beer].self, from: data) else {
      return .failure(.invalidDecoding)
    }
    
    return .success(decodedResponse)
    
  }
}

