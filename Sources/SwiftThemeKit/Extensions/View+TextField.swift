import SwiftUI

public extension View {
  @ViewBuilder
  func applyThemeTextFieldStyle() -> some View {
    self
      .modifier(ThemedTextFiedlModifier())
      .modifier(ApplyFinalTextFieldStyleModifier())
  }

  @ViewBuilder
  func textFieldVariant(_ variant: TextFieldVariant) -> some View {
    self.modifier(TextFieldVariantModifier(token: variant))
  }

  @ViewBuilder
  func textFieldSize(_ size: TextFieldSize) -> some View {
    self.modifier(TextFieldSizeModifier(token: size))
  }

  @ViewBuilder
  func textFieldShape(_ shape: TextFieldShape) -> some View {
    self.modifier(TextFieldShapeModifier(token: shape))
  }

  @ViewBuilder
  func isError(_ isError: Bool) -> some View {
    self.modifier(TextFieldErrorModifier(isError: isError))
  }

  /// Applies a specific font style to the button's label without affecting other styling.
  ///
  /// - Parameters:
  ///   - token: The text style token from your theme typography.
  ///   - weight: Optional font weight override.
  /// - Returns: A view with the font applied to the label.
  @ViewBuilder
  func textFieldFont(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(TextFieldFontModifier(token: fontToken))
  }
}
