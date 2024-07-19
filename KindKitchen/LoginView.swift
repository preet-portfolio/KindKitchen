import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isAuthenticated = false
    @State private var showAlert = false

    var body: some View {
        VStack {
            Spacer()
            Text("Login")
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
            
            Button(action: {
                if email == "user@example.com" && password == "password" {
                    isAuthenticated = true
                } else {
                    showAlert = true
                }
            }) {
                Text("Login")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Credentials"), message: Text("Please try again."), dismissButton: .default(Text("OK")))
            }
            
            NavigationLink(destination: PasswordRecoveryView()) {
                Text("Forgot Password?")
                    .foregroundColor(.blue)
                    .padding(.top, 10)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Login", displayMode: .inline)
        .background(
            NavigationLink(destination: UserDashboardView(), isActive: $isAuthenticated) {
                EmptyView()
            }
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
