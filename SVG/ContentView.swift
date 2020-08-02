
import SwiftUI
struct ContentView: View {
    @State var endAmount: CGFloat = 0
    @State var isFilled = false
    let ctColor1 = UIColor.fromHexString("29ABE2")
    let ctColor2 = UIColor.fromHexString("#0A62BC")
    let pathBounds = UIBezierPath.calculateBounds(paths: [.ctLogo1, .ctLogo2])
    var body: some View {
    ZStack{
        ShapeView(bezier: .ctLogo1, pathBounds: pathBounds)
        .trim(from:0, to:endAmount)
            .stroke(Color(ctColor1), lineWidth: 2)
        ShapeView(bezier: .ctLogo1, pathBounds: pathBounds)
            .fill(Color(ctColor1).opacity(isFilled ? 1:0))
        ShapeView(bezier: .ctLogo2, pathBounds: pathBounds)
            .fill(Color(ctColor2).opacity(isFilled ? 1:0))
    }
    .frame(width: 300, height:300*pathBounds.height/pathBounds.width)
    .onAppear{
        withAnimation(.easeInOut(duration:2)){
            self.endAmount = 1
        }
        withAnimation(Animation.easeInOut(duration:2).delay(2)){
            self.isFilled = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
    }
}
}
