import Foundation

struct Beer: Decodable {
  let id: BeerID
  let name: String
  let tagline: String
  let firstBrewed: Date
  let description: String
  let imageURL: URL
}

enum BeerSerializingError: Error {
  case invalidDate
  case invalidURL
}

extension BeerSerializingError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .invalidDate: return "The passed String can't be converted to a Date"
    case .invalidURL: return "The passed String can't be converted to an URL"
    }
  }
}

extension Beer {
  private static var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/yyyy"
    return dateFormatter
  }

  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case tagline
    case firstBrewed
    case description
    case imageURL = "imageUrl" // -> image_url
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    let unformattedID = try container.decode(Int.self, forKey: .id)
    id = BeerID(rawValue: unformattedID)
    name = try container.decode(String.self, forKey: .name)
    tagline = try container.decode(String.self, forKey: .tagline)

    let dateString = try container.decode(String.self, forKey: .firstBrewed)
    guard let firstBrewed = Self.dateFormatter.date(from: dateString) else { throw BeerSerializingError.invalidDate }
    self.firstBrewed = firstBrewed

    description = try container.decode(String.self, forKey: .description)

    let imageURLString = try container.decode(String.self, forKey: .imageURL)
    guard let imageURL = URL(string: imageURLString) else { throw BeerSerializingError.invalidURL }
    self.imageURL = imageURL
  }
}
