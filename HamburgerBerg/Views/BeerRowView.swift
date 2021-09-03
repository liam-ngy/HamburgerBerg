import SwiftUI

struct BeerRowView: View {
  let title: String
  let description: String

  var body: some View {
    HStack {
      Image(systemName: "flame")
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.blue)

      Spacer()
        .frame(width: 16, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

      VStack(alignment: .leading) {
        Text(title)
          .font(.title3)

        Text(description)
          .font(.caption2)
      }

      Spacer()
    }
    .frame(height: 64)
    .padding()
  }
}

struct BeerRowView_Previews: PreviewProvider {
  static var previews: some View {
    BeerRowView(title: "Alsterwasser", description: "beer beer beer beer beer beer beer")
  }
}
