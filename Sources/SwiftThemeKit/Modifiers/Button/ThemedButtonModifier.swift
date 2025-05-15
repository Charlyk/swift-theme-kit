import SwiftUI

struct ThemedButtonModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.buttonConfiguration) private var config

  func body(content: Content) -> some View {
    let configuration = config ?? ButtonConfiguration(
      variant: theme.buttons.variant,
      shape: theme.buttons.shape,
      size: theme.buttons.size
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
        shape: config.shape ?? theme.buttons.shape
      )
    )
  }
}
