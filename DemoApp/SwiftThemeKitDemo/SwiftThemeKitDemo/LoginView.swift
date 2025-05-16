import SwiftUI
import SwiftThemeKit

struct LoginView: View {
  @Environment(\.appTheme) var theme

  var body: some View {
    VStack(alignment: .leading) {
      TextField("Email", text: .constant(""))
        .textFieldVariant(.outlined)

      TextField("Password", text: .constant(""))
        .textFieldVariant(.outlined)

      Button {

      } label: {
        Text("Forgot Password?")
      }
      .plainTextButton()
      .padding(.top, theme.spacing.sm)
    }
    .padding(.horizontal, theme.spacing.md)
    .navigationTitle("Login", style: .titleLarge)
  }
}

#Preview {
  NavigationView {
    LoginView()
  }
}
