import XCTest
import Combine
@testable import HamburgerBerg

final class ListViewModelTests: XCTestCase {
  func test_sut_fetchBeers_resultIsSuccessful_setBeersProperty() throws {
    // Given
    let sut = ListViewModel(service: .stubPunk(isSuccess: true))

    // When
    XCTAssertNil(sut.error)
    XCTAssertEqual(sut.beers, .stub)
  }

  func test_sut_fetchBeers_resultIsFailure_setBeersProperty() throws {
    // Given
    let sut = ListViewModel(service: .stubPunk(isSuccess: false))

    // When
    XCTAssertNotNil(sut.error, "\(sut.error)")
    XCTAssertEqual(sut.beers, [])
  }

}
