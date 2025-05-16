import SwiftUI

/// A view modifier that applies a specific `ButtonVariant` to a view while preserving
/// other button styling properties from the theme or existing environment configuration.
struct ButtonVariantModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonVariant

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: token,
      shape: config.shape ?? theme.buttons.shape,
      size: config.size ?? theme.buttons.size,
      font: config.font
    )
    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A view modifier that applies a specific `ButtonSize` to a view while retaining
/// the current shape, variant, and font from the environment or theme.
struct ButtonSizeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonSize

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: config.shape ?? theme.buttons.shape,
      size: token,
      font: config.font
    )
    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A view modifier that applies a specific `ButtonShape` to a view while preserving
/// the current variant, size, and font configuration from the environment or theme.
struct ButtonShapeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonShape

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: token,
      size: config.size ?? theme.buttons.size,
      font: config.font
    )
    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}

/// A view modifier that applies a custom `ThemeFontToken` to a button's text style
/// without overriding its size, variant, or shape.
struct ButtonFontModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ThemeFontToken

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: config.shape ?? theme.buttons.shape,
      size: config.size ?? theme.buttons.size,
      font: token
    )
    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape,
          font: configuration.font
        )
      )
      .environment(\.buttonConfiguration, configuration)
  }
}
