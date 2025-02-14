import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer() // 가변공간 생성 다른 뷰들 사이에 유동적으로 공간을 추가할 수 있습니다
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding() //padding()은 SwiftUI에서 뷰 주위에 여백을 추가하는 데 사용됩니다.
    }
}

#Preview {
    ContentView()
}
