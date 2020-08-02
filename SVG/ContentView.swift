
import SwiftUI
struct ContentView: View {
    @State var endAmount: CGFloat = 0
    @State var isFilled = false
    let ctColor1 = UIColor.fromHexString("#F88A36")
    let ctColor2 = UIColor.fromHexString("#FD2020")
    let pathBounds = UIBezierPath.calculateBounds(paths: [.ctLogo1, .ctLogo2])
    var body: some View {
    ZStack{
        ShapeView(bezier: .ctLogo1, pathBounds: pathBounds)
        .trim(from:0, to:endAmount)
            .stroke(Color(ctColor1), lineWidth: 2)
        ShapeView(bezier: .ctLogo2, pathBounds: pathBounds)
            .fill(Color(ctColor2).opacity(isFilled ? 1:0))
    }
    .frame(width: 300, height:300*pathBounds.height/pathBounds.width)
}
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
