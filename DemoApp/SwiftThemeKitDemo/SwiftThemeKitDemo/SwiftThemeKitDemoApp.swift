import SwiftUI
import SwiftThemeKit

@main
struct SwiftThemeKitDemoApp: App {
  @StateObject private var themeManager = ThemeManager()

  var body: some Scene {
    WindowGroup {
      ThemeProvider(light: themeManager.colorThemeLight, dark: themeManager.colorThemeDark) {
        NavigationStack {
          ContentView()
        }
      }
      .environmentObject(themeManager)
      .preferredColorScheme(
        themeManager.scheme == .system ? .light :
          themeManager.scheme == .dark ? .dark : .light
      )
    }
  }
}
