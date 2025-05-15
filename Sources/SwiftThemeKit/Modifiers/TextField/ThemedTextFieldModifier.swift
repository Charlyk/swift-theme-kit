import SwiftUI

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
