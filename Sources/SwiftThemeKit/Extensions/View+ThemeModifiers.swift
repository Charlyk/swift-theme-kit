import SwiftUI

public extension View {
  /// Applies a shadow to the view using a predefined `ShadowToken` from the current theme.
  ///
  /// - Parameter token: The shadow scale to apply (e.g. `.sm`, `.md`, `.focus`).
  /// - Returns: A view with the shadow applied.
  @ViewBuilder
  func shadow(_ token: ShadowToken) -> some View {
    self.modifier(ShadowModifier(token: token))
  }

  /// Applies a font style from the current theme using a `TextStyleToken`.
  ///
  /// - Parameter token: The typography style to use (e.g. `.headlineMedium`, `.labelSmall`).
  /// - Returns: A view with the themed font applied.
  @ViewBuilder
  func font(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(TypographyModifier(token: fontToken))
  }

  /// Applies a foreground text or icon color using a theme-defined `ColorToken`.
  ///
  /// - Parameter token: The color token to apply (e.g. `.primary`, `.onSurface`).
  /// - Returns: A view with the foreground color applied.
  @ViewBuilder
  func foregroundColor(_ token: ColorToken) -> some View {
    self.modifier(ForegroundModifier(token: token))
  }

  /// Applies a background fill color using a theme-defined `ColorToken`.
  ///
  /// - Parameter token: The color token to apply (e.g. `.surface`, `.primaryContainer`).
  /// - Returns: A view with the background color applied.
  @ViewBuilder
  func backgroundColor(_ token: ColorToken) -> some View {
    self.modifier(BackgroundModifier(token: token, edgesIgnoringSafeArea: nil))
  }

  /// Applies a background fill color using a theme-defined `ColorToken`.
  ///
  /// - Parameter token: The color token to apply (e.g. `.surface`, `.primaryContainer`).
  /// - Parameter edgesIgnoringSafeArea: Edges that should be ignored by the background color
  /// - Returns: A view with the background color applied.
  @ViewBuilder
  func backgroundColor(_ token: ColorToken, edgesIgnoringSafeArea: Edge.Set) -> some View {
    self.modifier(BackgroundModifier(token: token, edgesIgnoringSafeArea: edgesIgnoringSafeArea))
  }

  /// Applies padding using a `SpacingToken` from the theme and optional edge set.
  ///
  /// - Parameters:
  ///   - edges: The edges to apply padding to (default is `.all`).
  ///   - token: The spacing token to use (e.g. `.sm`, `.lg`).
  /// - Returns: A view with the specified padding applied.
  @ViewBuilder
  func padding(_ edges: Edge.Set = .all, _ token: SpacingToken) -> some View {
    self.modifier(PaddingModifier(edges: edges, token: token))
  }

  /// Applies a corner radius using a `RadiusToken` from the current theme.
  ///
  /// - Parameter token: The radius token to apply (e.g. `.sm`, `.pill`, `.circle`).
  /// - Returns: A view with rounded corners.
  @ViewBuilder
  func cornerRadius(_ token: RadiusToken) -> some View {
    self.modifier(CornerRadiusModifier(token: token))
  }

  /// Clips the view using a `RoundedRectangle` shape with radius defined by a `RadiusToken`.
  ///
  /// - Parameters:
  ///   - token: The radius token to apply (e.g. `.lg`, `.pill`).
  ///   - style: The corner style (`.circular` or `.continuous`). Default is `.circular`.
  /// - Returns: A view clipped to a rounded shape.
  @ViewBuilder
  func clipRadius(_ token: RadiusToken, style: RoundedCornerStyle = .circular) -> some View {
    self.modifier(ClipRadiusModifier(token: token, style: style))
  }

  /// Applies a themed stroke (border) to the current view.
  ///
  /// - Parameters:
  ///   - width: A `StrokeToken` representing the stroke width from the theme.
  ///   - radius: A `RadiusToken` representing the corner radius. Default is `.md`.
  ///   - color: A `ColorToken` for stroke color. Default is `.primary`.
  @ViewBuilder
  func stroke(
    _ width: StrokeToken,
    radius: RadiusToken = .md,
    color: ColorToken = .primary
  ) -> some View {
    self.modifier(StrokeModifier(width: width, radius: radius, color: color))
  }

  /// Applies a theme shape to the current view
  ///
  /// - Parameters:
  ///   - toke: A `ShapeToken` representing the shape from the theme,
  @ViewBuilder
  func clipShape(_ token: ShapeToken) -> some View {
    self.modifier(ClipShapeModifier(token: token))
  }

  // MARK: - Button Specific Modifiers

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
  func labelStyle(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(ButtonFontModifier(token: fontToken))
  }
}
