import SwiftUI

private struct AppThemeKey: EnvironmentKey {
  static let defaultValue = Theme.defaultLight
}

private struct ButtonConfigurationKey: EnvironmentKey {
  static let defaultValue: ButtonConfiguration = ButtonConfiguration()
}

private struct TypographyKey: EnvironmentKey {
  static let defaultValue: ThemeFontToken = ThemeFontToken(.bodyMedium)
}

extension EnvironmentValues {
  public var appTheme: Theme {
    get { self[AppThemeKey.self] }
    set { self[AppThemeKey.self] = newValue }
  }

  var buttonConfiguration: ButtonConfiguration {
    get { self[ButtonConfigurationKey.self] }
    set { self[ButtonConfigurationKey.self] = newValue }
  }

  var typographyStyle: ThemeFontToken {
    get { self[TypographyKey.self] }
    set { self[TypographyKey.self] = newValue }
  }
}
