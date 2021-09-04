import SwiftUI

struct BeerDetailsView: View {
  let formattedAbv: String
  let formattedFirstBrewed: String

  var body: some View {
    Group {
      Text(
        "Details",
        comment: "Based on the beer it can be paired of with some foods"
      )
        .font(Font.title).bold()
        .foregroundStyle(.secondary)
        .accessibilityAddTraits(.isHeader)
      
      Text("**abv:** \(formattedAbv)")
      Text("**First time brewed:** \(formattedFirstBrewed)")
    }
  }
}

struct BeerDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    BeerDetailsView(formattedAbv: "39%", formattedFirstBrewed: "Date")
  }
}
