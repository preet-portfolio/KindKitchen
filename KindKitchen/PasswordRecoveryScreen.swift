import SwiftUI

struct PasswordRecoveryView: View {
    @State private var email = ""
    @State private var isRecoverTapped = false

    var body: some View {
        VStack {
            Spacer()
            Text("Recover Password")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.primary)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            Button(action: {
                isRecoverTapped.toggle()
            }) {
                Text("Recover Password")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isRecoverTapped ? Color.red : Color.green)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Recover Password", displayMode: .inline)
    }
}

struct PasswordRecoveryView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecoveryView()
    }
}
