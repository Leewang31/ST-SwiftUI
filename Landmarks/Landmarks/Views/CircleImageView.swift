import SwiftUI


struct CircleImageView: View {
    var image:Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                 Circle().stroke(.gray, lineWidth: 4)
             }
            .shadow(radius: 7)
    }
}


#Preview {
    CircleImageView(image: Image("turtlerock"))
}
