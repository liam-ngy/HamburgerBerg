import Foundation

// MARK: - Model

struct Beer: Decodable, Equatable {
  let id: BeerID
  let name: String
  let tagline: String
  let firstBrewed: Date
  let description: String
  let abv: Double
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

// MARK: - Decoding

extension Beer {
  private static var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/yyyy"
    return dateFormatter
  }

  // I could use `.convertFromSnakeCase` but in this case I wanted to customize `imageURL` as well
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case tagline
    case firstBrewed = "first_brewed"
    case description
    case abv
    case imageURL = "image_url"
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

    abv = try container.decode(Double.self, forKey: .abv)

    let imageURLString = try container.decode(String.self, forKey: .imageURL)
    guard let imageURL = URL(string: imageURLString) else { throw BeerSerializingError.invalidURL }
    self.imageURL = imageURL
  }
}

// MARK: - Stub

extension Beer {
  static var stub: Beer {
    .init(
      id: 1,
      name: "Thailand",
      tagline: "Sawadi",
      firstBrewed: .distantPast,
      description: "blabla",
      abv: 49.9,
      imageURL: URL(string: "https://www.thailand.com")!
    )
  }
}
