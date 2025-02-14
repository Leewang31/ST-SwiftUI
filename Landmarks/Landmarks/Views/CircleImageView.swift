import SwiftUI


struct CircleImageView: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                 Circle().stroke(.gray, lineWidth: 4)
             }
            .shadow(radius: 7)
    }
}


#Preview {
    CircleImageView()
}
