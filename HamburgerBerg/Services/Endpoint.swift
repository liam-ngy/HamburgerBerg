import Foundation
import SwiftSyntax
// Reference: https://www.swiftbysundell.com/articles/constructing-urls-in-swift/
// TODO: Check for HTTPTypes introduced in WWDC 2023

struct Endpoint {
  enum Version: String {
    case v1 = "v1"
    case v2 = "v2"
  }

  enum PathComponent: String  {
    case beers = "/beers"
  }

  let version: Version = .v2
  let path: [PathComponent]

  private var combinedPathComponents: String {
    path.reduce("") { partialResult, pathComponent in
      partialResult + pathComponent.rawValue
    }
  }

  let queryItems: [URLQueryItem]

  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    // Adding a dynamic versioning would be a nice way to do as well
    components.host = "api.punkapi.com"
    components.path = "/\(version.rawValue)" + combinedPathComponents
    components.queryItems = queryItems.isEmpty ? nil : queryItems

    return components.url
  }

}



