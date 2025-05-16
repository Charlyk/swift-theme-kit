import SwiftUI

/// A modifier that injects a resolved `ButtonConfiguration` into the environment,
/// combining any user-defined button styling (via `.buttonVariant`, `.buttonSize`, etc.)
/// with fallback values from the current theme.
///
/// This allows downstream modifiers or styles to access a complete and consistent button configuration.
///
/// - Environment:
///   - `appTheme`: Provides default button configuration from the active theme.
///   - `buttonConfiguration`: Allows partial overrides (e.g., shape only) to be merged.
struct ThemedButtonModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: config.shape ?? theme.buttons.shape,
      size: config.size ?? theme.buttons.size,
      font: config.font
    )

    content
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A modifier that applies the final `ThemeButtonStyle` to the view using the resolved
/// `ButtonConfiguration` from the environment or the theme defaults.
///
/// This should be applied after all other button configuration modifiers to ensure
/// that the composed button style reflects all customizations.
///
/// - Environment:
///   - `appTheme`: Provides fallback values for variant, size, shape, and font.
///   - `buttonConfiguration`: The final resolved configuration for the button.
struct ApplyFinalButtonStyleModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config

  func body(content: Content) -> some View {
    content.buttonStyle(
      ThemeButtonStyle(
        variant: config.variant ?? theme.buttons.variant,
        size: config.size ?? theme.buttons.size,
        shape: config.shape ?? theme.buttons.shape,
        font: config.font
      )
    )
  }
}
