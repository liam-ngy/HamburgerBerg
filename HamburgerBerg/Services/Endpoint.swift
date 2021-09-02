import Foundation
// Reference: https://www.swiftbysundell.com/articles/constructing-urls-in-swift/

struct Endpoint {
  enum Version: String {
    case v1 = "v1"
    case v2 = "v2"
  }

  let version: Version = .v2
  let path: String
  let queryItems: [URLQueryItem]

  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    // Adding a dynamic versioning would be a nice way to do as well
    components.host = "api.punkapi.com"
    components.path = "/\(version.rawValue)" + path
    components.queryItems = queryItems.isEmpty ? nil : queryItems

    return components.url
  }
}



