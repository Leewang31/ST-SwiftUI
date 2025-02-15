import SwiftUI

@main //@main 속성 앱의 시작 포인트를 나타낸다.

struct LandmarksApp: App {
    @State private var modelData = ModelData()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
