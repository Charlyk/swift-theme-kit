import SwiftUI

public extension View {
  /// Applies a text editor variant style
  func textEditorVariant(_ variant: TextFieldVariant) -> some View {
    modifier(TextEditorVariantModifier(token: variant))
  }

  /// Applies a text editor size
  func textEditorSize(_ size: TextFieldSize) -> some View {
    modifier(TextEditorSizeModifier(token: size))
  }

  /// Applies a text editor shape
  func textEditorShape(_ shape: TextFieldShape) -> some View {
    modifier(TextEditorShapeModifier(token: shape))
  }

  /// Applies a text editor font
  func textEditorFont(_ font: ThemeFontToken) -> some View {
    modifier(TextEditorFontModifier(token: font))
  }

  /// Sets the text editor error state
  func textEditorError(_ isError: Bool = true) -> some View {
    modifier(TextEditorErrorModifier(isError: isError))
  }

  /// Sets the text editor height constraints
  func textEditorHeight(min: CGFloat? = nil, max: CGFloat? = nil) -> some View {
    modifier(TextEditorHeightModifier(minHeight: min, maxHeight: max))
  }

  /// Convenience method to apply the theme text editor style using environment configuration
  func applyThemeTextEditorStyle() -> some View {
    modifier(ThemedTextEditorModifier())
  }
}
