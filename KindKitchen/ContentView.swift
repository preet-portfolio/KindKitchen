import SwiftUI

struct ContentView: View {
    @State private var image: Image? = nil
    @State private var inputImage: UIImage? = nil
    @State private var showingImagePicker = false
    @State private var recipeSuggestions: [String] = []

    var body: some View {
        VStack {
            Text("Kind Kitchen")
                .font(.largeTitle)
                .padding()

            Button(action: {
                self.showingImagePicker = true
            }) {
                Text("Take Photo")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            image?
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding()

            if !recipeSuggestions.isEmpty {
                Text("Recipe Suggestions:")
                    .font(.headline)
                    .padding()

                ForEach(recipeSuggestions, id: \.self) { suggestion in
                    Text(suggestion)
                        .padding()
                }
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        // Here you can call your image recognition and recipe suggestion functions
        // For now, let's add some mock data
        recipeSuggestions = ["Pasta with Tomato Sauce", "Vegetable Stir Fry", "Chicken Salad"]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
