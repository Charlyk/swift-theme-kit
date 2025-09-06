import SwiftUI

/// A view modifier that injects a fully resolved `TextFieldConfiguration` into the environment.
///
/// It merges the currently active configuration from the environment with the default values
/// from the theme. This allows individual style modifiers (e.g., shape, size) to override only
/// parts of the configuration without resetting the others.
///
/// Use this as the base modifier when building a styled text field.
struct ThemedTextEditorModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textEditorConfiguration) private var config

  func body(content: Content) -> some View {
    let configuration = TextEditorConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: config.isError
    )
    content
      .environment(\.textEditorConfiguration, configuration)
  }
}
