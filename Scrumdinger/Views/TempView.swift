import SwiftUI

@Observable
class SimpleGameResult {
    internal init(score: Int) {
        self.score = score
    }
    let id = UUID()
    var score: Int
}

struct ContentView: View {
     var results = [
        SimpleGameResult(score: 8),
        SimpleGameResult(score: 5),
        SimpleGameResult(score: 10)
    ]
    @State private var myCounter = 0
    @State private var name : String = "Lpbbu"
    
    var body: some View {
        VStack {
            Text("myCounter is \(myCounter)")
            ForEach(results, id: \.id) { result in
                Text("Result: \(result.score)")
            }
            TextField("Emter your name", text: $name)
        }
        .frame(width: 200, height: 200, alignment: .center)
        .onAppear(perform: {
            results[0].score = 99
          //  myCounter += 1
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
