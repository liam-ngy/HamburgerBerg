
import XCTest
@testable import HamburgerBerg

final class EndpointTests: XCTestCase {
  func test_sut_url_isValid_withZeroComponent() throws {
    // Given
    let sut = Endpoint(path: [], queryItems: [])
    let expectedURL = try XCTUnwrap(URL(string: "https://api.punkapi.com/v2"))
    XCTAssertEqual(sut.url, expectedURL)
  }

  func test_sut_url_isValid_withOneComponent() throws {
    // Given
    let sut = Endpoint(path: [.beers], queryItems: [])
    let expectedURL = try XCTUnwrap(URL(string: "https://api.punkapi.com/v2/beers"))

    XCTAssertEqual(sut.url, expectedURL)
  }

  func test_sut_url_isValid_withTwoComponent() throws {
    // Given
    let sut = Endpoint(path: [.beers, .beers], queryItems: [])
    let expectedURL = try XCTUnwrap(URL(string: "https://api.punkapi.com/v2/beers/beers"))

    // Then
    XCTAssertEqual(sut.url, expectedURL)
  }

  func test_sut_version_isV2() {
    let sut = Endpoint(path: [.beers, .beers], queryItems: [])
    XCTAssertEqual(sut.version, .v2)
  }
}
