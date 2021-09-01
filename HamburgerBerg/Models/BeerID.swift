import Foundation

/// For having a model of BeerID, we have a type check for ID and have a safer way to represent the model
struct BeerID: RawRepresentable, Hashable, Codable {
  // MARK: - Properties

  let rawValue: String

  // MARK: - Initializer

  init(rawValue: String) {
    self.rawValue = rawValue
  }
}

extension BeerID: ExpressibleByStringLiteral {

  /// Initializes a `BeerID` from a string literal, e.g.:
  /// ```
  /// let BeerID: BeerID = "foo-bar"
  /// ```
  /// Instead of:
  /// ```
  /// let BeerID: BeerID = .init(rawValue: "foo-bar")
  /// ```
  public init(stringLiteral rawValue: String) {
    self.init(rawValue: rawValue)
  }
}
