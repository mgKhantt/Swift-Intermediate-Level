import SwiftUI

struct RotationGestureBootCamp: View {
    
    @State var angle: Angle = .zero
    @State var lastAngle: Angle = .zero
    
    var body: some View {
        Text("Hello, World!")
            .foregroundStyle(.white)
            .frame(width: 200, height: 100)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(lastAngle + angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            // Snap to nearest 90 degrees
                            let degrees = (lastAngle + value).degrees
                            let snapped = (degrees / 90).rounded() * 90
                            
                            // Normalize between 0 and 360
                            let normalized = snapped.truncatingRemainder(dividingBy: 360) //subrtact 360 from snapped value
                            
                            // Convert negative to positive equivalent (e.g. -90 => 270)
                            lastAngle = .degrees(normalized < 0 ? normalized + 360 : normalized)
                            
                            // Reset temporary angle
                            angle = .zero
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootCamp()
}
