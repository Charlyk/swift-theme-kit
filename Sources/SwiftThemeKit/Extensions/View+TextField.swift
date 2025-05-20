import SwiftUI

public extension View {
  /// Applies the full SwiftThemeKit text field style using the theme’s configuration system.
  ///
  /// This modifier sets up the base layout, padding, shape, and interaction styling from the theme,
  /// using environment-provided values such as `TextFieldVariant`, `TextFieldSize`, `TextFieldShape`, and typography tokens.
  ///
  /// This is **optional** — you can use `textFieldVariant`, `textFieldSize`, or `textFieldFont` individually
  /// if you prefer to build a custom layout.
  ///
  /// - Returns: A view with the themed text field style applied.
  ///
  /// ### Example:
  /// ```swift
  /// TextField("Email", text: $email)
  ///   .applyThemeTextFieldStyle()
  ///   .textFieldVariant(.outlined)
  /// ```
  @ViewBuilder
  func applyThemeTextFieldStyle() -> some View {
    self
      .modifier(ThemedTextFiedlModifier())
      .modifier(ApplyFinalTextFieldStyleModifier())
  }

  /// Sets the visual variant of the text field, such as `.filled`, `.outlined`, or `.underlined`.
  ///
  /// This determines the field's border, background, and focus styling.
  ///
  /// - Parameter variant: The desired text field variant.
  /// - Returns: A view with the variant applied to the environment.
  @ViewBuilder
  func textFieldVariant(_ variant: TextFieldVariant) -> some View {
    self.modifier(TextFieldVariantModifier(token: variant))
  }

  /// Overrides the size of the text field, such as `.small`, `.medium`, or `.large`.
  ///
  /// This affects internal padding, height, and default font unless overridden with `textFieldFont`.
  ///
  /// - Parameter size: The desired size token.
  /// - Returns: A view with the size styling applied.
  @ViewBuilder
  func textFieldSize(_ size: TextFieldSize) -> some View {
    self.modifier(TextFieldSizeModifier(token: size))
  }

  /// Sets the corner shape of the text field (e.g., `.rounded`, `.capsule`, `.rectangle`).
  ///
  /// The shape is applied to the background or outline and affects how the field is clipped.
  ///
  /// - Parameter shape: The shape token to apply.
  /// - Returns: A view with the shape applied.
  @ViewBuilder
  func textFieldShape(_ shape: TextFieldShape) -> some View {
    self.modifier(TextFieldShapeModifier(token: shape))
  }

  /// Flags the text field as being in an error state, typically changing its color or border.
  ///
  /// Use this to visually indicate validation failure or incorrect input.
  ///
  /// - Parameter isError: A Boolean value indicating if the field is in error.
  /// - Returns: A view with error styling conditionally applied.
  @ViewBuilder
  func isError(_ isError: Bool) -> some View {
    self.modifier(TextFieldErrorModifier(isError: isError))
  }

  /// Applies a specific font style to the text field label/content using the theme's typography system.
  ///
  /// This only affects the font (size, weight, line height) and does not change layout or padding.
  ///
  /// - Parameters:
  ///   - token: The text style token to apply (e.g., `.bodySmall`, `.labelLarge`).
  ///   - weight: Optional custom font weight (e.g., `.medium`, `.semibold`).
  /// - Returns: A view with the font styling applied.
  @ViewBuilder
  func textFieldFont(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(TextFieldFontModifier(token: fontToken))
  }
}
