import SwiftUI
import SwiftThemeKit

struct GetStartedView: View {
  @AppStorage("colorScheme") private var colorScheme: String = "system"
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

      Button {
        colorScheme = "dark"
      } label: {
        Text("Get Started")
      }
      .buttonSize(.fullWidth)
      .buttonShape(.capsule)

      Button {
        colorScheme = "light"
      } label: {
        Text("Login")
      }
      .buttonVariant(.tonal)
      .buttonSize(.fullWidth)
      .buttonShape(.capsule)
    }
    .padding(.horizontal, theme.spacing.md)
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
