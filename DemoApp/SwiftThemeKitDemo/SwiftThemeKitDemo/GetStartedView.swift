import SwiftUI
import SwiftThemeKit

struct GetStartedView: View {
  @AppStorage("colorScheme") private var colorScheme: String = "light"
  @Environment(\.appTheme) private var theme
  
  var body: some View {
    VStack {
      topContainer
        .weight(1)

      bottomContainer
        .weight(1)
    }
    .backgroundColor(.surface, edgesIgnoringSafeArea: .all)
  }

  private var topContainer: some View {
    VStack(spacing: theme.spacing.md) {
      Text("Develop faster with SwiftThemeKit")
        .font(.displaySmall)
        .multilineTextAlignment(.center)

      Text("Join over 100 million people who use SwifthThemeKit to develop better UI.")
        .font(.bodyLarge)
        .multilineTextAlignment(.center)
        .padding(.bottom, theme.spacing.md)

      NavigationLink {
        OnboardingGoalView()
      } label: {
        Text("Get Started")
      }
      .buttonSize(.fullWidth)

      NavigationLink {
        LoginView()
      } label: {
        Text("Login")
      }
      .buttonVariant(.tonal)
      .buttonSize(.fullWidth)
    }
    .padding(.horizontal, .md)
    .backgroundColor(.surface, edgesIgnoringSafeArea: .all)
  }

  private var bottomContainer: some View {
    Image("bottomContainer")
      .resizable()
      .edgesIgnoringSafeArea(.all)
  }
}

#Preview {
  GetStartedView()
}
