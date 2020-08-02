
import SwiftUI
struct CoolView: View {
    @State var endAmount: CGFloat = 0
    @State var isFilled = false
    let ctColor1 = UIColor.fromHexString("#F88A36")
    let ctColor2 = UIColor.fromHexString("#FD2020")
    @State private var scale: Double = 360
    let pathBounds = UIBezierPath.calculateBounds(paths: [.swiftLogo])
    var body: some View {
    ZStack{
        ShapeView(bezier: .swiftLogo, pathBounds: pathBounds)
        .trim(from:0, to:endAmount)
            .stroke(Color(ctColor1), lineWidth: 2)
        ShapeView(bezier: .swiftLogo, pathBounds: pathBounds)
            .fill(LinearGradient(gradient: Gradient(colors: [Color(ctColor1),Color(ctColor2)]), startPoint: .topLeading, endPoint: .bottomTrailing)).opacity(isFilled ? 1:0)
    }
    .frame(width: 300, height:300*pathBounds.height/pathBounds.width)
    .rotation3DEffect(.degrees(scale) , axis: (x:0, y:1, z:0))
    .onAppear{
        withAnimation(.easeInOut(duration:2)){
            self.endAmount = 1
        }
        withAnimation(Animation.easeInOut(duration:2).delay(2)){
            self.isFilled = true
        }
        withAnimation(Animation.linear(duration:4.0).repeatForever(autoreverses: false).delay(4)){
            self.scale = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    CoolView()
    }
}
}
