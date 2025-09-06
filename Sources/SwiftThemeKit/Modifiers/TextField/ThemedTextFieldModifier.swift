import SwiftUI

/// A view modifier that injects a fully resolved `TextFieldConfiguration` into the environment.
///
/// It merges the currently active configuration from the environment with the default values
/// from the theme. This allows individual style modifiers (e.g., shape, size) to override only
/// parts of the configuration without resetting the others.
///
/// Use this as the base modifier when building a styled text field.
struct ThemedTextFiedlModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textFieldConfiguration) private var config

  func body(content: Content) -> some View {
    let configuration = TextFieldConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: config.isError
    )
    content
      .environment(\.textFieldConfiguration, configuration)
  }
}

/// A view modifier that applies the final `ThemeTextFieldStyle` to a text field
/// using the current configuration from the environment.
///
/// This should be applied after all other configuration modifiers to ensure
/// the final style reflects all resolved variant, size, shape, font, and error values.
///
/// Typically used internally by `.applyThemeTextFieldStyle()` to finalize styling.
struct ApplyFinalTextFieldStyleModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textFieldConfiguration) private var config

  func body(content: Content) -> some View {
    content.textFieldStyle(
      ThemeTextFieldStyle(
        variant: config.variant ?? theme.textFields.variant,
        size: config.size ?? theme.textFields.size,
        shape: config.shape ?? theme.textFields.shape,
        font: config.font,
        isError: config.isError
      )
    )
  }
}
