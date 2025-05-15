import SwiftUI

public extension View {
  /// Applies a complete themed button style using values from the environment or theme defaults.
  ///
  /// This should be the base modifier applied to any Button that wants to use the theme system.
  /// It will apply the variant, size, and shape defined either explicitly or from `Theme.buttons`.
  ///
  /// It should be called **before** other modifiers like `.buttonVariant(...)`.
  @ViewBuilder
  func applyThemeButtonStyle() -> some View {
    self
      .modifier(ThemedButtonModifier())
      .modifier(ApplyFinalButtonStyleModifier())
  }

  /// Overrides the button variant (e.g., `.filled`, `.outline`, `.text`, etc.) for a single button.
  ///
  /// - Parameter variant: The variant of the button to use.
  /// - Returns: A view with the given variant stored in environment for styling resolution.
  @ViewBuilder
  func buttonVariant(_ variant: ButtonVariant) -> some View {
    self.modifier(ButtonVariantModifier(token: variant))
  }

  /// Overrides the button size (e.g., `.small`, `.medium`, `.large`, `.fullWidth`) for a single button.
  ///
  /// - Parameter size: The size of the button.
  /// - Returns: A view with the given size stored in environment for use in layout and padding.
  @ViewBuilder
  func buttonSize(_ size: ButtonSize) -> some View {
    self.modifier(ButtonSizeModifier(token: size))
  }

  /// Overrides the button shape (e.g., `.capsule`, `.rounded`, `.rectangle`) for a single button.
  ///
  /// - Parameter shape: The shape style of the button.
  /// - Returns: A view with the given shape stored in environment for consistent visual appearance.
  @ViewBuilder
  func buttonShape(_ shape: ButtonShape) -> some View {
    self.modifier(ButtonShapeModifier(token: shape))
  }

  /// Applies a text-only button style with no padding or background.
  ///
  /// Best used for links or minimal inline buttons. You can optionally override the font style and weight.
  ///
  /// - Parameters:
  ///   - style: The font style to use, defaults to `.buttonText`.
  ///   - weight: Optional font weight override.
  /// - Returns: A view with minimal button styling applied.
  @ViewBuilder
  func plainTextButton(_ style: TextStyleToken = .buttonText, weight: Font.Weight? = nil) -> some View {
    self.buttonStyle(PlainTextButtonStyle(token: ThemeFontToken(style, weight: weight)))
  }

  /// Applies a specific font style to the button's label without affecting other styling.
  ///
  /// - Parameters:
  ///   - token: The text style token from your theme typography.
  ///   - weight: Optional font weight override.
  /// - Returns: A view with the font applied to the label.
  @ViewBuilder
  func buttonLabelStyle(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(ButtonFontModifier(token: fontToken))
  }
}
