import os.log
import Foundation
/// Reference: https://www.avanderlee.com/workflow/oslog-unified-logging/

extension String {
  /// - NOTE: Force unwrap is advisable here, if `bundleIdentifier` is `nil`,
  /// we should not allow the customer to open an invalid app anyway.
  static let subsystem = Bundle.main.bundleIdentifier!
}


// Alternatively use a global helper method
enum LogCategory: String {
  case `default` = "Default"
  case networking = "Networking"
}

private extension OSLogType {
  var emoji: String {
    switch self {
    case .info: return "ℹ️ "
    case .error: return "❌ "
    default: return "🐼 "
    }
  }
}

func beerLog(
  _ message: String,
  function: String = #function,
  file: String = #file,
  line: Int = #line,
  _ category: LogCategory = .default,
  _ type: OSLogType = .default
) {
  let newMessage = type.emoji + message

  os_log(
    "[%{public}@/%{public}@:%{public}@] %{public}@",
    log: OSLog(subsystem: .subsystem, category: category.rawValue),
    type: type,
    (file as NSString).lastPathComponent,
    function, "\(line)",
    newMessage
  )
}
