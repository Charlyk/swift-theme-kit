import SwiftUI

public extension View {
  /// Applies a shadow to the view using a predefined `ShadowToken` from the current theme.
  ///
  /// The shadow style (color, radius, offset) is defined in the current theme.
  ///
  /// - Parameter token: The shadow token to apply (e.g. `.sm`, `.md`, `.focus`).
  /// - Returns: A view with the theme shadow applied.
  @ViewBuilder
  func shadow(_ token: ShadowToken) -> some View {
    self.modifier(ShadowModifier(token: token))
  }

  /// Applies a themed font style from the current theme using a `TextStyleToken`.
  ///
  /// The font size, weight, and line height are defined by the token.
  ///
  /// - Parameters:
  ///   - token: The typography style to use (e.g. `.headlineMedium`, `.labelSmall`).
  ///   - weight: Optional override for font weight (e.g., `.semibold`, `.regular`).
  /// - Returns: A view with the themed font applied.
  @ViewBuilder
  func font(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(TypographyModifier(token: fontToken))
  }

  /// Applies a themed foreground color (text, icon, etc.) using a `ColorToken`.
  ///
  /// - Parameter token: The color token to apply (e.g. `.primary`, `.onSurface`).
  /// - Returns: A view with the specified foreground color.
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
    self.modifier(BackgroundColorModifier(token: token, edgesIgnoringSafeArea: nil))
  }

  /// Applies a background fill color using a theme-defined `ColorToken`, ignoring safe area on specified edges.
  ///
  /// - Parameters:
  ///   - token: The color token to apply.
  ///   - edgesIgnoringSafeArea: The edges where the safe area should be ignored.
  /// - Returns: A view with the background color applied.
  @ViewBuilder
  func backgroundColor(_ token: ColorToken, edgesIgnoringSafeArea: Edge.Set) -> some View {
    self.modifier(BackgroundColorModifier(token: token, edgesIgnoringSafeArea: edgesIgnoringSafeArea))
  }

  /// Applies a background shape with optional fill color using theme-defined tokens.
  ///
  /// - Parameters:
  ///   - token: The shape token to apply (e.g. `.sm`, `.md`).
  ///   - color: Optional fill color for the shape.
  /// - Returns: A view with a shaped background.
  @ViewBuilder
  func backgroundShape(_ token: ShapeToken, color: ColorToken? = nil) -> some View {
    self.modifier(BackgroundShapeModifier(token: token, colorToken: color, edgesIgnoringSafeArea: nil))
  }

  /// Applies a background shape with optional fill color and safe area edge control.
  ///
  /// - Parameters:
  ///   - token: The shape token to apply.
  ///   - color: Optional fill color.
  ///   - edgesIgnoringSafeArea: The edges where safe area should be ignored.
  /// - Returns: A view with the shaped background.
  @ViewBuilder
  func backgroundShape(_ token: ShapeToken, color: ColorToken? = nil, edgesIgnoringSafeArea: Edge.Set) -> some View {
    self.modifier(BackgroundShapeModifier(token: token, colorToken: color, edgesIgnoringSafeArea: edgesIgnoringSafeArea))
  }

  /// Applies padding using a `SpacingToken` from the theme on specified edges.
  ///
  /// - Parameters:
  ///   - edges: The edges to apply padding to (default is `.all`).
  ///   - token: The spacing token to use (e.g. `.sm`, `.lg`).
  /// - Returns: A view with themed padding.
  @ViewBuilder
  func padding(_ edges: Edge.Set = .all, _ token: SpacingToken) -> some View {
    self.modifier(PaddingModifier(edges: edges, token: token))
  }

  /// Applies uniform padding using a `SpacingToken` from the theme.
  ///
  /// - Parameter token: The spacing token to use.
  /// - Returns: A view with themed padding.
  @ViewBuilder
  func padding(_ token: SpacingToken) -> some View {
    self.modifier(PaddingModifier(edges: .all, token: token))
  }

  /// Applies a corner radius using a `RadiusToken` from the current theme.
  ///
  /// - Parameter token: The radius token to apply (e.g. `.sm`, `.pill`, `.circle`).
  /// - Returns: A view with rounded corners.
  @ViewBuilder
  func cornerRadius(_ token: RadiusToken) -> some View {
    self.modifier(CornerRadiusModifier(token: token))
  }

  /// Clips the view to a rounded rectangle using a `RadiusToken` and optional style.
  ///
  /// - Parameters:
  ///   - token: The radius token to use.
  ///   - style: The corner style, either `.circular` or `.continuous`.
  /// - Returns: A clipped view.
  @ViewBuilder
  func clipRadius(_ token: RadiusToken, style: RoundedCornerStyle = .circular) -> some View {
    self.modifier(ClipRadiusModifier(token: token, style: style))
  }

  /// Applies a themed border stroke using stroke width, corner radius, and color from the theme.
  ///
  /// - Parameters:
  ///   - width: The stroke width from the theme.
  ///   - radius: The corner radius from the theme (default is `.md`).
  ///   - color: The border color from the theme (default is `.primary`).
  /// - Returns: A view with the border stroke applied.
  @ViewBuilder
  func stroke(
    _ width: StrokeToken,
    radius: RadiusToken = .md,
    color: ColorToken = .primary
  ) -> some View {
    self.modifier(StrokeModifier(width: width, radius: radius, color: color))
  }

  /// Clips the view using a shape defined in the current theme.
  ///
  /// - Parameter token: A `ShapeToken` from the theme.
  /// - Returns: A view clipped to the given shape.
  @ViewBuilder
  func clipShape(_ token: ShapeToken) -> some View {
    self.modifier(ClipShapeModifier(token: token))
  }

  /// Sets a navigation title styled using the theme’s typography.
  ///
  /// - Parameters:
  ///   - title: The string to display.
  ///   - style: Typography token (e.g. `.titleLarge`).
  ///   - weight: Optional custom weight override.
  /// - Returns: A view with the themed navigation title.
  func navigationTitle(
    _ title: String,
    style: TextStyleToken = .headlineLarge,
    weight: Font.Weight? = nil
  ) -> some View {
    self.modifier(ThemedNavigationTitleModifier(title: title, token: style, weight: weight))
  }

  /// Applies layout weight and expands the view to fill available space.
  ///
  /// Inspired by Jetpack Compose's `weight()`, useful in `HStack`/`VStack`.
  ///
  /// - Parameter value: The proportional layout weight.
  /// - Returns: A weighted view.
  func weight(_ value: Double) -> some View {
    self
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .layoutPriority(value)
  }

  /// Expands the view to fill available width and height, aligned as specified.
  ///
  /// - Parameter alignment: The alignment within the space. Default is `.leading`.
  /// - Returns: A fully expanded view.
  func fillMaxSize(alignment: Alignment = .leading) -> some View {
    self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
  }

  /// Expands the view to fill the maximum width, aligned as specified.
  ///
  /// - Parameter alignment: The alignment within the space. Default is `.leading`.
  /// - Returns: A view that fills the max width.
  func fillMaxWidth(alignment: Alignment = .leading) -> some View {
    self.frame(maxWidth: .infinity, alignment: alignment)
  }

  /// Expands the view to fill the maximum height, aligned as specified.
  ///
  /// - Parameter alignment: The alignment within the space. Default is `.leading`.
  /// - Returns: A view that fills the max height.
  func fillMaxHeight(alignment: Alignment = .leading) -> some View {
    self.frame(maxHeight: .infinity, alignment: alignment)
  }
  
  /// Sets an exact square size for the view using the same value for width and height.
  ///
  /// - Parameters:
  ///   - size: The size to apply for both width and height.
  ///   - alignment: The alignment inside the frame. Default is `.center`.
  /// - Returns: A view with fixed size.
  func size(_ size: CGFloat, alignment: Alignment = .center) -> some View {
    self.frame(width: size, height: size, alignment: alignment)
  }
}
