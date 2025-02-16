import SwiftUI


struct CategoryHome: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationSplitView {
            List {
                   ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                       Text(key)
//                           .onAppear {
//                               // 뷰가 나타날 때 콘솔 로그 출력
//                               print(key)
//                           }
                   }
               }
               .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    CategoryHome()
        .environment(ModelData())
}
