import SwiftUI

// MARK: - Environment Keys

/// An internal environment key used to inject the current `Theme` into the view hierarchy.
///
/// This enables all SwiftThemeKit components to access theme-defined colors, typography,
/// and shapes via `@Environment(\.appTheme)`.
private struct AppThemeKey: EnvironmentKey {
  static let defaultValue: Theme = .defaultLight
}

/// An internal environment key used to inject `ButtonConfiguration` into the view hierarchy.
///
/// This allows button styling modifiers like `.buttonVariant(_:)`, `.buttonSize(_:)`, etc.,
/// to update and share configuration consistently across the component.
private struct ButtonConfigurationKey: EnvironmentKey {
  static let defaultValue: ButtonConfiguration = ButtonConfiguration()
}

/// An internal environment key used to inject `TextFieldConfiguration` into the view hierarchy.
///
/// This enables SwiftThemeKit's text field components to access variant, shape, and size
/// defined via `.textFieldVariant(_:)`, `.textFieldShape(_:)`, etc.
private struct TextFieldConfigurationKey: EnvironmentKey {
  static let defaultValue: TextFieldConfiguration = TextFieldConfiguration()
}

/// An internal environment key used to pass down a single `ThemeFontToken` in cases
/// where a view hierarchy needs to share a custom typography override.
///
/// Used by components like `PlainTextButtonStyle` or custom label styling.
private struct TypographyKey: EnvironmentKey {
  static let defaultValue: ThemeFontToken = ThemeFontToken(.bodyMedium)
}

/// Environment key for text editor configuration
private struct TextEditorConfigurationKey: EnvironmentKey {
  static let defaultValue = TextEditorConfiguration()
}

// MARK: - Environment Values

public extension EnvironmentValues {

  /// The current `Theme` instance injected into the environment.
  ///
  /// This is used by all SwiftThemeKit components to access colors, shapes, typography, and spacing.
  ///
  /// Set by wrapping your app or view in a `ThemeProvider`.
  var appTheme: Theme {
    get { self[AppThemeKey.self] }
    set { self[AppThemeKey.self] = newValue }
  }

  /// The current button configuration stored in the environment.
  ///
  /// Used internally by SwiftThemeKit to resolve button style modifiers such as
  /// `.buttonVariant(_:)`, `.buttonShape(_:)`, `.buttonSize(_:)`, etc.
  internal var buttonConfiguration: ButtonConfiguration {
    get { self[ButtonConfigurationKey.self] }
    set { self[ButtonConfigurationKey.self] = newValue }
  }

  /// The current text field configuration stored in the environment.
  ///
  /// Used internally to manage styling applied via modifiers like
  /// `.textFieldVariant(_:)`, `.textFieldSize(_:)`, `.textFieldFont(_:)`, etc.
  internal var textFieldConfiguration: TextFieldConfiguration {
    get { self[TextFieldConfigurationKey.self] }
    set { self[TextFieldConfigurationKey.self] = newValue }
  }

  /// The currently applied typography style override, when scoped to a local context.
  ///
  /// This is typically used for lightweight components like label-only buttons or icon captions
  /// that apply a custom `ThemeFontToken`.
  internal var typographyStyle: ThemeFontToken {
    get { self[TypographyKey.self] }
    set { self[TypographyKey.self] = newValue }
  }

  internal var textEditorConfiguration: TextEditorConfiguration {
    get { self[TextEditorConfigurationKey.self] }
    set { self[TextEditorConfigurationKey.self] = newValue }
  }
}
