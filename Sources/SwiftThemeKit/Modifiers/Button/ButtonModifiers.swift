import SwiftUI

/// A view modifier that overrides the button's visual style variant (e.g., `.filled`, `.outline`, `.text`).
///
/// This modifier updates the button configuration in the environment and reapplies
/// the `ThemeButtonStyle` with the new variant, preserving any previously applied
/// size, shape, font, or color settings.
///
/// - Note: This modifier is typically used in combination with `applyThemeButtonStyle()` or independently
/// if you build your button composition manually.
struct ButtonVariantModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonVariant

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: token,
      shape: config.shape ?? theme.buttons.shape,
      size: config.size ?? theme.buttons.size,
      font: config.font,
      backgroundColor: config.backgroundColor,
      foregroundColor: config.foregroundColor
    )

    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font,
          backgroundColor: configuration.backgroundColor,
          foregroundColor: configuration.foregroundColor
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A view modifier that overrides the button's size (e.g., `.small`, `.medium`, `.large`, `.fullWidth`).
///
/// The size impacts layout dimensions and padding, and may also influence the default font
/// unless explicitly overridden.
struct ButtonSizeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonSize

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: config.shape ?? theme.buttons.shape,
      size: token,
      font: config.font,
      backgroundColor: config.backgroundColor,
      foregroundColor: config.foregroundColor
    )

    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font,
          backgroundColor: configuration.backgroundColor,
          foregroundColor: configuration.foregroundColor
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A view modifier that overrides the button's shape (e.g., `.capsule`, `.rounded`, `.rectangle`).
///
/// This modifier updates the clipping shape and background styling based on the shape token.
struct ButtonShapeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonShape

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: token,
      size: config.size ?? theme.buttons.size,
      font: config.font,
      backgroundColor: config.backgroundColor,
      foregroundColor: config.foregroundColor
    )

    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font,
          backgroundColor: configuration.backgroundColor,
          foregroundColor: configuration.foregroundColor
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A view modifier that applies a custom `ThemeFontToken` to the button’s label text.
///
/// This allows for fine-grained control over typography independent of the button size.
struct ButtonFontModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ThemeFontToken

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: config.shape ?? theme.buttons.shape,
      size: config.size ?? theme.buttons.size,
      font: token,
      backgroundColor: config.backgroundColor,
      foregroundColor: config.foregroundColor
    )

    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font,
          backgroundColor: configuration.backgroundColor,
          foregroundColor: configuration.foregroundColor
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A view modifier that overrides the background color of a button, regardless of its variant.
///
/// This is useful for applying a custom color in special states or brand-specific overrides.
struct ButtonBackgroundModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let color: Color

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: config.shape ?? theme.buttons.shape,
      size: config.size ?? theme.buttons.size,
      font: config.font,
      backgroundColor: color,
      foregroundColor: config.foregroundColor
    )

    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font,
          backgroundColor: configuration.backgroundColor,
          foregroundColor: configuration.foregroundColor
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A view modifier that overrides the foreground color (text/icon) of a button.
///
/// This takes precedence over the color defined by the theme or variant.
struct ButtonForegroundModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let color: Color

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: config.shape ?? theme.buttons.shape,
      size: config.size ?? theme.buttons.size,
      font: config.font,
      backgroundColor: config.backgroundColor,
      foregroundColor: color
    )

    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font,
          backgroundColor: configuration.backgroundColor,
          foregroundColor: configuration.foregroundColor
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}
