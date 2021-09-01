import Foundation

struct Beer: Decodable {
  let id: BeerID
  let name: String
  let tagline: String
  let firstBrewed: Date
  let description: String
  let imageURL: String
}

