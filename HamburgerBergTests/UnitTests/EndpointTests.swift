
import XCTest
@testable import HamburgerBerg

final class EndpointTests: XCTestCase {

    func test_base() throws {
      // Given
      let sut = Endpoint(path: "/beers", queryItems: [])
      let expectedURL = try XCTUnwrap(URL(string: "https://api.punkapi.com/v2/beers"))

        XCTAssertEqual(sut.url, expectedURL)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
