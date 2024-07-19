import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isRegistered = false
    @State private var showAlert = false

    var body: some View {
        VStack {
            Spacer()
            Text("Register")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.primary)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            Button(action: {
                if password == confirmPassword && !email.isEmpty {
                    isRegistered = true
                } else {
                    showAlert = true
                }
            }) {
                Text("Register")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Registration"), message: Text("Please check your details and try again."), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Register", displayMode: .inline)
        .background(
            NavigationLink(destination: UserDashboardView(), isActive: $isRegistered) {
                EmptyView()
            }
        )
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
