import SwiftUI

private struct AppThemeKey: EnvironmentKey {
  static let defaultValue: Theme? = nil
}

private struct ButtonConfigurationKey: EnvironmentKey {
  static let defaultValue: ButtonConfiguration = ButtonConfiguration()
}

private struct TextFieldConfigurationKey: EnvironmentKey {
  static let defaultValue: TextFieldConfiguration = TextFieldConfiguration()
}

private struct TypographyKey: EnvironmentKey {
  static let defaultValue: ThemeFontToken = ThemeFontToken(.bodyMedium)
}

extension EnvironmentValues {
  public var appTheme: Theme {
    get {
#if DEBUG
      if self[AppThemeKey.self] == nil {
        assertionFailure("SwiftThemeKit: ⚠️ ThemeProvider is missing. Falling back to defaultLight.")
      }
#endif
      return self[AppThemeKey.self] ?? .defaultLight
    }
    set { self[AppThemeKey.self] = newValue }
  }

  var buttonConfiguration: ButtonConfiguration {
    get { self[ButtonConfigurationKey.self] }
    set { self[ButtonConfigurationKey.self] = newValue }
  }

  var textFieldConfiguration: TextFieldConfiguration {
    get { self[TextFieldConfigurationKey.self] }
    set { self[TextFieldConfigurationKey.self] = newValue }
  }

  var typographyStyle: ThemeFontToken {
    get { self[TypographyKey.self] }
    set { self[TypographyKey.self] = newValue }
  }
}
