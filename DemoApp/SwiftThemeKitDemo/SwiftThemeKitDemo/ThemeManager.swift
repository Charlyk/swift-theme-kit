import SwiftUI
import SwiftThemeKit

enum AppColorScheme: String {
  case system, light, dark
}

final class ThemeManager: ObservableObject {
  @AppStorage("colorScheme") private var storedScheme: String = AppColorScheme.light.rawValue {
    didSet { objectWillChange.send() }
  }
  @AppStorage("colorTheme") private var storedTheme: String = "theme1" {
    didSet { objectWillChange.send() }
  }

  @Published var colorMode: String = AppColorScheme.light.rawValue {
    didSet { storedScheme = colorMode }
  }

  @Published var selectedTheme: String = "theme1" {
    didSet { storedTheme = selectedTheme }
  }

  var scheme: AppColorScheme {
    get { AppColorScheme(rawValue: storedScheme) ?? .system }
    set { storedScheme = newValue.rawValue }
  }

  var colorThemeLight: Theme {
    if storedTheme == "theme1" {
      return lightTheme1
    } else if storedTheme == "theme2" {
      return lightTheme2
    } else {
      return lightTheme3
    }
  }

  var colorThemeDark: Theme {
    if storedTheme == "theme1" {
      return darkTheme1
    } else if storedTheme == "theme2" {
      return darkTheme2
    } else {
      return darkTheme3
    }
  }
}
