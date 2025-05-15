import SwiftUI

struct TextFieldVariantModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textFieldConfiguration) private var config
  let token: TextFieldVariant

  func body(content: Content) -> some View {
    let size = config.size ?? theme.textFields.size
    let configuration = TextFieldConfiguration(
      variant: token,
      size: size,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: config.isError
    )
    content
      .textFieldStyle(
        ThemeTextFieldStyle(
          variant: configuration.variant ?? theme.textFields.variant,
          size: configuration.size ?? theme.textFields.size,
          shape: configuration.shape ?? theme.textFields.shape,
          font: configuration.font,
          isError: configuration.isError
        )
      )
      .environment(
        \.textFieldConfiguration,
         configuration
      )
  }
}

struct TextFieldSizeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textFieldConfiguration) private var config
  let token: TextFieldSize

  func body(content: Content) -> some View {
    let configuration = TextFieldConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: token,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: config.isError
    )
    content
      .textFieldStyle(
        ThemeTextFieldStyle(
          variant: configuration.variant ?? theme.textFields.variant,
          size: configuration.size ?? theme.textFields.size,
          shape: configuration.shape ?? theme.textFields.shape,
          font: configuration.font,
          isError: configuration.isError
        )
      )
      .environment(
        \.textFieldConfiguration,
         configuration
      )
  }
}

struct TextFieldShapeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textFieldConfiguration) private var config
  let token: TextFieldShape

  func body(content: Content) -> some View {
    let configuration = TextFieldConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: token,
      font: config.font,
      isError: config.isError
    )
    content
      .textFieldStyle(
        ThemeTextFieldStyle(
          variant: configuration.variant ?? theme.textFields.variant,
          size: configuration.size ?? theme.textFields.size,
          shape: configuration.shape ?? theme.textFields.shape,
          font: configuration.font,
          isError: configuration.isError
        )
      )
      .environment(
        \.textFieldConfiguration,
         configuration
      )
  }
}

struct TextFieldFontModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textFieldConfiguration) private var config
  let token: ThemeFontToken

  func body(content: Content) -> some View {
    let configuration = TextFieldConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: config.shape ?? theme.textFields.shape,
      font: token,
      isError: config.isError
    )
    content
      .textFieldStyle(
        ThemeTextFieldStyle(
          variant: configuration.variant ?? theme.textFields.variant,
          size: configuration.size ?? theme.textFields.size,
          shape: configuration.shape ?? theme.textFields.shape,
          font: configuration.font,
          isError: configuration.isError
        )
      )
      .environment(
        \.textFieldConfiguration,
         configuration
      )
  }
}

struct TextFieldErrorModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textFieldConfiguration) private var config
  let isError: Bool

  func body(content: Content) -> some View {
    let configuration = TextFieldConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: isError
    )
    content
      .textFieldStyle(
        ThemeTextFieldStyle(
          variant: configuration.variant ?? theme.textFields.variant,
          size: configuration.size ?? theme.textFields.size,
          shape: configuration.shape ?? theme.textFields.shape,
          font: configuration.font,
          isError: configuration.isError
        )
      )
      .environment(
        \.textFieldConfiguration,
         configuration
      )
  }
}
