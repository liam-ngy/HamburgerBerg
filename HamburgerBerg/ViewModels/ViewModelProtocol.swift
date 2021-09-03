import Foundation

protocol ViewModelProtocol { }

extension ViewModelProtocol where Self == ListViewModel {
  static var list: ListViewModel {
    ListViewModel()
  }
}
