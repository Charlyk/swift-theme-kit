import SwiftUI

struct ButtonVariantModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonVariant

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: token,
      shape: config.shape ?? theme.buttons.shape,
      size: config.size ?? theme.buttons.size
    )
    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape
        )
      )
      .environment(
        \.buttonConfiguration,
         configuration
      )
  }
}

struct ButtonSizeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonSize

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: config.shape ?? theme.buttons.shape,
      size: token
    )
    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape
        )
      )
      .environment(
        \.buttonConfiguration,
         configuration
      )
  }
}

struct ButtonShapeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config
  let token: ButtonShape

  func body(content: Content) -> some View {
    let configuration = ButtonConfiguration(
      variant: config.variant ?? theme.buttons.variant,
      shape: token,
      size: config.size ?? theme.buttons.size
    )
    content
      .buttonStyle(
        ThemeButtonStyle(
          variant: configuration.variant ?? theme.buttons.variant,
          size: configuration.size ?? theme.buttons.size,
          shape: configuration.shape ?? theme.buttons.shape
        )
      )
      .environment(
        \.buttonConfiguration,
         configuration
      )
  }
}
