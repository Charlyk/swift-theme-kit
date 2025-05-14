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
    func font(_ token: TextStyleToken) -> some View {
        self.modifier(TypographyModifier(token: token))
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
}
