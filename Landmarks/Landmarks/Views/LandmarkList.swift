import SwiftUI


struct LandmarkList: View {
    /**
     * @State는 뷰 내부에서 값이 변경될 수 있는 상태를 저장하는 속성입니다.
     * 이 값이 변경될 때 SwiftUI는 해당 뷰를 다시 렌더링하여 최신 상태를 반영합니다.
     */
//    @State private var showFavoritesOnly = false
    @State private var showFavoritesOnly = true

    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationSplitView{
            // 필터링된 값을 보여준다 showFavoritesOnly에 따라
            List(filteredLandmarks) { landmark in
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
