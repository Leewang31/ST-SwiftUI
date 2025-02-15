import SwiftUI


struct LandmarkDetail: View {
    var landmark: Landmark

    var body: some View {
        ScrollView {
            //locationCoordinate 값 전달
            MapView(coordinate: landmark.locationCoordinate).frame(height: 300)

            //image 값 전달
            CircleImageView(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)


                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }

        // 헤더에 노출시킬 타이틀 커스텀
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
