import Foundation
import os.log

/// For having a model of BeerID, we have a type check for ID and have a safer way to represent the model
struct BeerID: RawRepresentable, Hashable, Codable {
  // MARK: - Properties

  let rawValue: Int

  // MARK: - Initializer

  init(rawValue: Int) {
    self.rawValue = rawValue
  }
}

extension BeerID: ExpressibleByIntegerLiteral , CustomDebugStringConvertible {
  /// Initializes a `BeerID` from a string literal, e.g.:
  /// ```
  /// let BeerID: BeerID = 1
  /// ```
  /// Instead of:
  /// ```
  /// let BeerID: BeerID = .init(rawValue: 1)
  /// ```
  public init(integerLiteral rawValue: Int) {
    self.init(rawValue: rawValue)
  }

  var debugDescription: String { String(rawValue) }
}
