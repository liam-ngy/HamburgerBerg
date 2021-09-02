import XCTest
@testable import HamburgerBerg

final class BeerSerializingTests: XCTestCase {

  var data: Data!
  var decoder: JSONDecoder!

    override func setUpWithError() throws {
      data = try jsonData()
      decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

  override func tearDownWithError() throws {
    data = nil
    decoder = nil
  }

  func test_beer_decoding() throws {
    XCTAssertNoThrow(try decoder.decode(Beer.self, from: data))
  }

  private func jsonData() throws -> Data {
    let testBundle = Bundle(for: type(of: self))
    let url = testBundle.url(forResource: "BeerJSONExample", withExtension: "json")
    return try Data(contentsOf: url!)
  }
}
