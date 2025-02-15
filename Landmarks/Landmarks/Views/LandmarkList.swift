import SwiftUI


struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}


#Preview {
    LandmarkList()
}
