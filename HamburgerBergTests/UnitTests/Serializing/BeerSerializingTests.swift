import XCTest
@testable import HamburgerBerg

final class BeerSerializingTests: XCTestCase {

  var data: Data!
  var decoder: JSONDecoder!

    override func setUpWithError() throws {
      data = jsonData("BeerJSONExample")
      decoder = JSONDecoder()
    }

  override func tearDownWithError() throws {
    data = nil
    decoder = nil
  }

  func test_beer_decoding() throws {
    XCTAssertNoThrow(try decoder.decode([Beer].self, from: data))
  }

  func test_beer_invalidJSON_withInvalidDate_checkErrorDescription() {
    // Given
    let invalidJSON = jsonData("InvalidBeerJSONDate")

    do {
      let decodedData = try decoder.decode([Beer].self, from: invalidJSON)
      XCTFail("\(decodedData)")
    } catch let error as BeerSerializingError {
      XCTAssertEqual(error, .invalidDate)
      XCTAssertEqual(error.errorDescription, "The passed String can\'t be converted to a Date")
    } catch {
      XCTFail("")
    }

  }

  func test_beer_invalidJSON_withInvalidURL_checkErrorDescription() {
    // Given
    let invalidJSON = jsonData("invalidBeerJSONURL")

    do {
      let decodedData = try decoder.decode([Beer].self, from: invalidJSON)
      XCTFail("\(decodedData)")
    } catch let error as BeerSerializingError {
      XCTAssertEqual(error, .invalidURL)
      XCTAssertEqual(error.errorDescription, "The passed String can\'t be converted to an URL")
    } catch {
      XCTFail("")
    }

  }


  private func jsonData(_ name: String) -> Data {
    let testBundle = Bundle(for: type(of: self))
    let url = testBundle.url(forResource: name, withExtension: "json")
    return try! Data(contentsOf: url!)
  }

}
