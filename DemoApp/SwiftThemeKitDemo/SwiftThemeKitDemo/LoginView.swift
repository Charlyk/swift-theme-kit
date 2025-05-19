import SwiftUI
import SwiftThemeKit

struct LoginView: View {
  @EnvironmentObject var themeManager: ThemeManager
  @Environment(\.appTheme) var theme
  @State private var email: String = "example@email.com"
  @State private var password: String = "12345678"
  @State private var remember: Bool = true

  var body: some View {
    VStack(alignment: .leading) {
      TextField("Email", text: $email)
        .textFieldVariant(.outlined)

      SecureField("Password", text: $password)
        .textFieldVariant(.outlined)

      Button {

      } label: {
        Text("Forgot Password?")
      }
      .plainTextButton()
      .padding(.top, .sm)

      Toggle(isOn: $remember) {
        Text("Remember sign in details")
          .font(.bodyMedium)
          .foregroundColor(theme.colors.outline)
      }

      Spacer()

      NavigationLink {
        HomeScreenView()
      } label: {
        Text("Log in")
      }
      .buttonVariant(.filled)
      .buttonSize(.fullWidth)
    }
    .padding(.all, .md)
    .navigationTitle("Login", style: .titleLarge)
    .backgroundColor(.surface, edgesIgnoringSafeArea: .all)
    .colorSchemeButton(colorScheme: $themeManager.scheme)
  }
}

#Preview {
  ThemeProvider {
    NavigationView {
      LoginView()
    }
  }
}
