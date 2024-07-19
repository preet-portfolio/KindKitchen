import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                HomeView()
            } else {
                VStack {
                    Image(systemName: "leaf.fill") // Replace with your app logo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding()
                    Text("Kind Kitchen")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
