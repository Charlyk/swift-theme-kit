import SwiftUI
import SwiftThemeKit

struct GetStartedView: View {
  @EnvironmentObject var themeManager: ThemeManager

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

      Picker("Theme", selection: $themeManager.colorMode) {
        ForEach(["light", "dark"], id: \.self) { text in
          Text(text)
        }
      }
      .pickerStyle(.segmented)

      Picker("Theme", selection: $themeManager.selectedTheme) {
        ForEach(["theme1", "theme2", "theme3"], id: \.self) { text in
          Text(text)
        }
      }
      .pickerStyle(.segmented)

      NavigationLink {
        HomeScreenView()
      } label: {
        Text("View components")
      }
      .buttonSize(.fullWidth)

      NavigationLink {

      } label: {
        Text("View examples")
      }
      .buttonVariant(.tonal)
      .buttonSize(.fullWidth)
      .disabled(true)
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
