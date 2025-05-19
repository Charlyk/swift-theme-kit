import SwiftUI
import SwiftThemeKit

struct OnboardingDoneView: View {
  @EnvironmentObject var themeManager: ThemeManager
  @Environment(\.appTheme) private var theme
  
  var body: some View {
    ZStack(alignment: .bottom) {
      VStack(spacing: theme.spacing.md) {
        Image("checkmark")

        Text("Verify your email")
          .font(.titleLarge)

        Text("Please check your email and follow the instructions to verify your account.")
          .font(.bodyMedium)
          .multilineTextAlignment(.center)
      }
      .fillMaxSize()

      VStack {
        NavigationLink {
          HomeScreenView()
        } label: {
          Text("Continue")
        }
        .buttonSize(.fullWidth)

        Button {

        } label: {
          Text("Resend verification")
        }
        .buttonSize(.fullWidth)
        .buttonVariant(.tonal)
        .disabled(true)
      }
      .frame(alignment: .bottom)
    }
    .padding(.md)
    .fillMaxSize()
    .colorSchemeButton(colorScheme: $themeManager.scheme)
  }
}

#Preview {
  OnboardingDoneView()
}
