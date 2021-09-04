import Foundation

struct BeerViewModel {
  private let model: Beer

  var id: BeerID { model.id }
  var title: String { model.name }
  var tagline: String { model.tagline }
  var formattedFirstBrewed: String { model.firstBrewed.formatted(.dateTime.month().year()) }

  var description: String { model.description }
  var formattedAbv: String { (model.abv/100).formatted(.percent) }
  var imageURL: URL { model.imageURL }

  init(model: Beer) {
    self.model = model
  }
}
