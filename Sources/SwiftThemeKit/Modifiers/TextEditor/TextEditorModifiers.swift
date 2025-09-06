import SwiftUI

/// A view modifier that applies a specific text editor variant (e.g. filled, outlined, underlined)
/// from the theme and updates the text editor configuration in the environment.
struct TextEditorVariantModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textEditorConfiguration) private var config
  let token: TextFieldVariant

  func body(content: Content) -> some View {
    let configuration = TextEditorConfiguration(
      variant: token,
      size: config.size ?? theme.textFields.size,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: config.isError,
      minHeight: config.minHeight,
      maxHeight: config.maxHeight
    )
    content
      .environment(\.textEditorConfiguration, configuration)
  }
}

/// A view modifier that applies a specific size to a text editor (e.g. small, medium, large),
/// affecting padding and font size.
struct TextEditorSizeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textEditorConfiguration) private var config
  let token: TextFieldSize

  func body(content: Content) -> some View {
    let configuration = TextEditorConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: token,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: config.isError,
      minHeight: config.minHeight,
      maxHeight: config.maxHeight
    )
    content
      .environment(\.textEditorConfiguration, configuration)
  }
}

/// A view modifier that applies a shape token to a text editor (e.g. rounded, capsule).
struct TextEditorShapeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textEditorConfiguration) private var config
  let token: TextFieldShape

  func body(content: Content) -> some View {
    let configuration = TextEditorConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: token,
      font: config.font,
      isError: config.isError,
      minHeight: config.minHeight,
      maxHeight: config.maxHeight
    )
    content
      .environment(\.textEditorConfiguration, configuration)
  }
}

/// A view modifier that overrides the font used in a themed text editor using a `ThemeFontToken`.
struct TextEditorFontModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textEditorConfiguration) private var config
  let token: ThemeFontToken

  func body(content: Content) -> some View {
    let configuration = TextEditorConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: config.shape ?? theme.textFields.shape,
      font: token,
      isError: config.isError,
      minHeight: config.minHeight,
      maxHeight: config.maxHeight
    )
    content
      .environment(\.textEditorConfiguration, configuration)
  }
}

/// A view modifier that updates the error state of a themed text editor.
struct TextEditorErrorModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textEditorConfiguration) private var config
  let isError: Bool

  func body(content: Content) -> some View {
    let configuration = TextEditorConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: isError,
      minHeight: config.minHeight,
      maxHeight: config.maxHeight
    )
    content
      .environment(\.textEditorConfiguration, configuration)
  }
}

/// A view modifier that sets the minimum and maximum height for a text editor.
struct TextEditorHeightModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  @Environment(\.textEditorConfiguration) private var config
  let minHeight: CGFloat?
  let maxHeight: CGFloat?

  func body(content: Content) -> some View {
    let configuration = TextEditorConfiguration(
      variant: config.variant ?? theme.textFields.variant,
      size: config.size ?? theme.textFields.size,
      shape: config.shape ?? theme.textFields.shape,
      font: config.font,
      isError: config.isError,
      minHeight: minHeight,
      maxHeight: maxHeight
    )
    content
      .environment(\.textEditorConfiguration, configuration)
  }
}
