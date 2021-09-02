import os.log
import Foundation
/// Reference: https://www.avanderlee.com/workflow/oslog-unified-logging/

extension OSLog {
  /// - NOTE: Force unwrap is advisable here, if `bundleIdentifier` is `nil`,
  /// we should not allow the customer to open an invalid app anyway.
  private static let subsystem = Bundle.main.bundleIdentifier!
}
