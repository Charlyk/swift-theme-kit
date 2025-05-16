import SwiftUI
import SwiftThemeKit

@main
struct SwiftThemeKitDemoApp: App {
  @AppStorage("colorScheme") private var colorScheme: String = "system"

  var body: some Scene {
    WindowGroup {
      ThemeProvider(
        light: Theme.defaultLight.copy(
          colors: ThemeColors.defaultLight.copy(
            primary: Color(hex: "7257FF"),
            secondaryContainer: Color(hex: "#F0EDFF"),
            onSecondaryContainer: Color(hex: "#5336E2")
          )
        ),
        dark: Theme.defaultDark.copy(
          colors: ThemeColors.defaultDark.copy(
            primary: Color(hex: "7257FF"),
            onPrimary: ThemeColors.defaultLight.onPrimary,
            secondaryContainer: Color(hex: "#F0EDFF"),
            onSecondaryContainer: Color(hex: "#5336E2")
          )
        )
      ) {
        ContentView()
      }
      .preferredColorScheme(
        colorScheme == "light" ? .light :
          colorScheme == "dark" ? .dark : nil
      )
    }
  }
}
