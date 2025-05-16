import SwiftUI

/// A view modifier that applies a specific text field variant (e.g. filled, outlined, underlined)
/// from the theme and updates the text field configuration in the environment.
///
/// Use this to customize the visual style of a text field while preserving other attributes
/// like size, shape, font, and error state.
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

/// A view modifier that applies a specific size to a text field (e.g. small, medium, large),
/// affecting padding and font size. Updates the text field configuration in the environment.
///
/// Useful for controlling the visual density of text field components.
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

/// A view modifier that applies a shape token to a text field (e.g. rounded, capsule),
/// and updates the text field configuration in the environment accordingly.
///
/// This modifier controls the geometry of the text field’s background and stroke.
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

/// A view modifier that overrides the font used in a themed text field using a `ThemeFontToken`,
/// and updates the text field configuration accordingly.
///
/// Use this when a specific typography style needs to be enforced regardless of size.
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

/// A view modifier that updates the error state of a themed text field, allowing it to visually
/// reflect validation or submission errors.
///
/// When `isError` is true, error colors from the theme will be applied to the text field.
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
