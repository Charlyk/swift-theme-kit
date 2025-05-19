import SwiftUI
import SwiftThemeKit

struct OnboardingEmailView: View {
  @EnvironmentObject var themeManager: ThemeManager
  @Environment(\.appTheme) var theme
  @State private var email: String = "example@email.com"

  var body: some View {
    VStack(alignment: .leading) {
      Text("Email address")
        .font(.titleLarge)

      TextField("Email", text: $email)
        .textFieldVariant(.outlined)

      Spacer()

      NavigationLink {
        OnboardingDoneView()
      } label: {
        Text("Next")
      }
      .buttonVariant(.filled)
      .buttonSize(.fullWidth)
    }
    .padding(.md)
    .backgroundColor(.surface)
    .colorSchemeButton(colorScheme: $themeManager.scheme)
  }
}

#Preview {
  NavigationStack {
    OnboardingEmailView()
  }
}
