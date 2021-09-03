import Foundation

protocol ViewModelProtocol: AnyObject { }

extension ViewModelProtocol where Self == ListViewModel {
  static var list: ListViewModel {
    ListViewModel()
  }
}
