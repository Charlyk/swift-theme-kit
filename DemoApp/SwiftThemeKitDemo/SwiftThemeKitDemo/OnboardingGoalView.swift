import SwiftUI
import SwiftThemeKit

struct OnboardingGoalView: View {
  @EnvironmentObject var themeManager: ThemeManager
  @Environment(\.appTheme) private var theme
  @State private var learnMore: Bool = false
  @State private var developFaster: Bool = false
  @State private var supportCollaboration: Bool = false
  @State private var justLooking: Bool = false
  @State private var isSecreet: Bool = false

  var body: some View {
    VStack(alignment: .leading, spacing: theme.spacing.md) {
      Text("Tell us your goal")
        .font(.displaySmall)

      Text("We will recommend design approaches that suit you")
        .font(.bodyMedium)
        .foregroundColor(.outline)
        .padding(.bottom, .md)

      Checkbox(
        isChecked: $learnMore,
        label: "Lear about design system"
      )

      Checkbox(
        isChecked: $developFaster,
        label: "Make UI development faster"
      )

      Checkbox(
        isChecked: $supportCollaboration,
        label: "Support collaboration with designers"
      )

      Checkbox(
        isChecked: $justLooking,
        label: "Just looking around"
      )

      Checkbox(
        isChecked: $isSecreet,
        label: "I don't want to say"
      )

      Spacer()

      NavigationLink {
        OnboardingEmailView()
      } label: {
        Text("Next")
      }
      .buttonSize(.fullWidth)
    }
    .padding(.md)
    .colorSchemeButton(colorScheme: $themeManager.scheme)
    .fillMaxSize()
    .backgroundColor(.surface, edgesIgnoringSafeArea: .all)
  }
}

#Preview {
  OnboardingGoalView()
}
