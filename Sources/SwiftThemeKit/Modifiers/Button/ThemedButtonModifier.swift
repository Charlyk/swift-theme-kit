import SwiftUI

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
