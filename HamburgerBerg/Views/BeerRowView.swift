import SwiftUI

struct BeerRowView: View {
  let title: String
  let description: String
  let imageURL: URL?

  var body: some View {
    HStack {
      AsyncImage(url: imageURL) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .frame(width: 100, height: 100)
        case let .success(image):
          image.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)

        case .failure:
          Image(systemName: "fire")
        @unknown default:
          ProgressView()
        }
      }


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
    BeerRowView(title: "Alsterwasser", description: "beer beer beer beer beer beer beer", imageURL: URL(string: "https://images.punkapi.com/v2/192.png"))
  }
}
