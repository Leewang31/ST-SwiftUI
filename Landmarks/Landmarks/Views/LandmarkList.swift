import SwiftUI


struct LandmarkList: View {
    var body: some View {
        NavigationSplitView{
            List(landmarks) { landmark in
                // 위치 이동 값 전달 landmark
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                }
                // 화면 노출 컴포넌트
                label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            // 상단 노출 타이틀
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList()
}
