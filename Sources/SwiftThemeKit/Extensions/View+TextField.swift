import SwiftUI

public extension View {

  /// Applies the theme's default text field style and propagates environment configuration
  /// like variant, size, shape, and font.
  ///
  /// Call this before other style-specific modifiers like `.textFieldVariant(_)` or `.textFieldFont(_)`.
  ///
  /// Example:
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

  /// Sets the visual variant of the text field (e.g., `.filled`, `.outlined`, `.underlined`).
  ///
  /// - Parameter variant: The style variant to apply.
  /// - Returns: A view with the variant applied.
  @ViewBuilder
  func textFieldVariant(_ variant: TextFieldVariant) -> some View {
    self.modifier(TextFieldVariantModifier(token: variant))
  }

  /// Sets the sizing token for the text field (e.g., `.small`, `.medium`, `.large`).
  ///
  /// This affects padding and default font unless overridden explicitly.
  ///
  /// - Parameter size: The size token to apply.
  /// - Returns: A view with the size styling applied.
  @ViewBuilder
  func textFieldSize(_ size: TextFieldSize) -> some View {
    self.modifier(TextFieldSizeModifier(token: size))
  }

  /// Sets the corner shape of the text field (e.g., `.rounded`, `.square`, `.capsule`).
  ///
  /// - Parameter shape: The shape token to apply.
  /// - Returns: A view with the shape applied.
  @ViewBuilder
  func textFieldShape(_ shape: TextFieldShape) -> some View {
    self.modifier(TextFieldShapeModifier(token: shape))
  }

  /// Marks the text field as being in an error state, typically changing the border color.
  ///
  /// - Parameter isError: A Boolean indicating if the field is in error state.
  /// - Returns: A view reflecting the error styling.
  @ViewBuilder
  func isError(_ isError: Bool) -> some View {
    self.modifier(TextFieldErrorModifier(isError: isError))
  }

  /// Applies a specific font style from the theme typography to the text field.
  ///
  /// This only modifies the font and leaves other field appearance unaffected.
  ///
  /// - Parameters:
  ///   - token: The typography token (e.g., `.bodySmall`, `.labelLarge`).
  ///   - weight: An optional font weight override.
  /// - Returns: A view with the font applied.
  @ViewBuilder
  func textFieldFont(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(TextFieldFontModifier(token: fontToken))
  }
}
