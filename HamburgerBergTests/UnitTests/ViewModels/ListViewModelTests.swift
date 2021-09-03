import XCTest
import Combine
@testable import HamburgerBerg

final class ListViewModelTests: XCTestCase {
  func test_sut_fetchBeers_resultIsSuccessful_setBeersProperty() throws {
    // Given
    let sut = ListViewModel(service: .stubPunk(isSuccess: true))

    // When
    switch sut.beers {
    case let .success(result):
      XCTAssertEqual(result, .stub)
    case let .failure(error):
      XCTFail("Expected success but failed with \(error)")
    }
  }

  func test_sut_fetchBeers_resultIsFailure_setBeersProperty() throws {
    // Given
    let sut = ListViewModel(service: .stubPunk(isSuccess: false))

    // When
    switch sut.beers {
    case let .success(result):
      XCTFail("Expected failure but got \(result)")
    case .failure: break
    }
  }

}
