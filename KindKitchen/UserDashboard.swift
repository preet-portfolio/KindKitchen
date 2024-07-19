import SwiftUI

struct UserDashboardView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome, User!")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.primary)
                .padding(.bottom, 20)
            
            Text("This is your dashboard.")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color.secondary)
                .padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Dashboard", displayMode: .inline)
    }
}

struct UserDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        UserDashboardView()
    }
}
