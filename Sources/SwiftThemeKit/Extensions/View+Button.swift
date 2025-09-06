import SwiftUI

public extension View {
  /// Applies the full SwiftThemeKit button style to the current view using the theme's button system.
  ///
  /// This modifier is **optional** but recommended when you want to use the default layout, padding,
  /// background, and interactive states provided by SwiftThemeKit.
  ///
  /// You can also apply individual overrides such as `buttonSize`, `buttonVariant`, or `buttonShape`
  /// without needing to use this modifier, especially if you are using your own custom button style.
  ///
  /// - Returns: A view with the themed button styling applied.
  @ViewBuilder
  func applyThemeButtonStyle() -> some View {
    self
      .modifier(ThemedButtonModifier())
      .modifier(ApplyFinalButtonStyleModifier())
  }
  
  /// Overrides the button variant (e.g. `.filled`, `.outline`, `.text`) for this specific button.
  ///
  /// This is stored in the view environment and affects how `applyThemeButtonStyle()` renders the background,
  /// border, and interaction behavior.
  ///
  /// - Parameter variant: The desired button style variant.
  /// - Returns: A view with the custom variant applied to the button context.
  @ViewBuilder
  func buttonVariant(_ variant: ButtonVariant) -> some View {
    self.modifier(ButtonVariantModifier(token: variant))
  }
  
  /// Overrides the button size (e.g. `.small`, `.medium`, `.large`, `.fullWidth`) for this button.
  ///
  /// The size affects height, padding, and possibly font size, based on the current theme configuration.
  ///
  /// - Parameter size: The size token to apply.
  /// - Returns: A view with the custom size stored in the environment.
  @ViewBuilder
  func buttonSize(_ size: ButtonSize) -> some View {
    self.modifier(ButtonSizeModifier(token: size))
  }
  
  /// Overrides the shape used for the button (e.g. `.capsule`, `.rounded`, `.rectangle`).
  ///
  /// This affects how the button is clipped and how the background and stroke are drawn.
  ///
  /// - Parameter shape: The shape token to apply to this button.
  /// - Returns: A view with the shape override applied.
  @ViewBuilder
  func buttonShape(_ shape: ButtonShape) -> some View {
    self.modifier(ButtonShapeModifier(token: shape))
  }
  
  /// Applies a minimal, text-only button style without background, padding, or borders.
  ///
  /// Best for inline links or toolbar actions where no container styling is needed.
  /// Can still use theme typography tokens for consistent font sizing.
  ///
  /// - Parameters:
  ///   - style: The typography style to apply (default is `.buttonText`).
  ///   - weight: Optional font weight override.
  /// - Returns: A button with stripped-down appearance and themed text.
  @ViewBuilder
  func plainTextButton(_ style: TextStyleToken = .buttonText, weight: Font.Weight? = nil) -> some View {
    self.buttonStyle(PlainTextButtonStyle(token: ThemeFontToken(style, weight: weight)))
  }
  
  /// Overrides only the font style of the button’s label while preserving all other styles (padding, background, etc.).
  ///
  /// Useful when you want to adjust the font of a button without affecting its variant or layout.
  ///
  /// - Parameters:
  ///   - token: The typography token to apply (e.g. `.labelLarge`, `.bodyMedium`).
  ///   - weight: Optional font weight override.
  /// - Returns: A view with the custom font style applied to the label.
  @ViewBuilder
  func buttonLabelStyle(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(ButtonFontModifier(token: fontToken))
  }
  
  /// Overrides the background color of the button's label content.
  ///
  /// This can be used to apply a custom background color instead of the theme-defined one
  /// (e.g., for special states or brand-specific overrides).
  ///
  /// - Parameter color: The color to use as the label's background.
  /// - Returns: A view with the background color applied to the button label.
  func buttonBackgroundColor(_ color: Color) -> some View {
    self.modifier(ButtonBackgroundModifier(color: color))
  }
  
  /// Overrides the foreground (text/icon) color of the button's label content.
  ///
  /// This affects the text/icon rendering but does not override other theme styles.
  ///
  /// - Parameter color: The color to use as the foreground.
  /// - Returns: A view with the foreground color applied to the button label.
  func buttonForegroundColor(_ color: Color) -> some View {
    self.modifier(ButtonForegroundModifier(color: color))
  }
}
