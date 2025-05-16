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

  /// Sets a custom navigation title using the theme's typography system.
  ///
  /// This modifier allows you to style the navigation bar title with a specific text style
  /// from your theme, and optionally apply a font weight.
  ///
  /// - Parameters:
  ///   - title: The string to display as the navigation title.
  ///   - style: The typography style token from your theme (e.g., `.headlineLarge`, `.titleMedium`). Defaults to `.headlineLarge`.
  ///   - weight: An optional font weight override (e.g., `.bold`, `.medium`).
  ///
  /// - Returns: A view with a themed navigation title applied.
  ///
  /// ### Example:
  /// ```swift
  /// NavigationStack {
  ///   MyView()
  ///     .navigationTitle("Settings", style: .titleLarge, weight: .semibold)
  /// }
  /// ```
  func navigationTitle(
    _ title: String,
    style: TextStyleToken = .headlineLarge,
    weight: Font.Weight? = nil
  ) -> some View {
    self.modifier(ThemedNavigationTitleModifier(title: title, token: style, weight: weight))
  }

  /// Applies layout weight to a view by allowing it to grow in all directions
  /// and prioritizing its space relative to sibling views.
  ///
  /// This is inspired by Jetpack Compose's `weight()` function and is useful
  /// in `HStack` and `VStack` when you want views to divide space proportionally.
  ///
  /// ### Example (Horizontal):
  /// ```swift
  /// HStack(spacing: 0) {
  ///   Color.red.weight(1)
  ///   Color.blue.weight(2)
  /// }
  /// ```
  ///
  /// ### Example (Vertical):
  /// ```swift
  /// VStack(spacing: 0) {
  ///   Color.green.weight(1)
  ///   Color.orange.weight(1)
  /// }
  /// ```
  ///
  /// - Parameter value: The layout priority weight relative to sibling views.
  /// - Returns: A view that fills available space based on priority.
  func weight(_ value: Double) -> some View {
    self
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .layoutPriority(value)
  }
}
