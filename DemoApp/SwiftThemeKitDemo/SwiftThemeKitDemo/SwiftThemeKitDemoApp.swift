import SwiftUI
import SwiftThemeKit

@main
struct SwiftThemeKitDemoApp: App {
  @StateObject private var themeManager = ThemeManager()

  var body: some Scene {
    WindowGroup {
      ThemeProvider {
        NavigationStack {
          ContentView()
        }
      }
      .environmentObject(themeManager)
      .preferredColorScheme(
        themeManager.scheme == .system ? nil :
          themeManager.scheme == .dark ? .dark : .light
      )
    }
  }
}
