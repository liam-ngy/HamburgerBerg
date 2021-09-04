import SwiftUI

struct FoodsPairingView: View {
  let foodPairing: [String]
    var body: some View {
      Group {
        Text(
          "Food pairing",
          comment: "Based on the beer it can be paired of with some foods"
        )
          .font(Font.title).bold()
          .foregroundStyle(.secondary)
          .padding(.top, 16)
          .accessibilityAddTraits(.isHeader)

        ForEach(values: foodPairing) {
          Text("- \($0)")
        }
      }
    }
}

struct FoodsPairingView_Previews: PreviewProvider {
    static var previews: some View {
      FoodsPairingView(foodPairing: ["foodpairing", "bam", "buuh"])
    }
}
