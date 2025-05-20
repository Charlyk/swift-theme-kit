import SwiftUI

/// A SwiftUI view that renders a shape using a color defined in the current theme.
///
/// `ThemedShape` allows developers to apply consistent, theme-based coloring to any SwiftUI `Shape`,
/// leveraging the `ColorToken` system from `Theme.colors`.
///
/// The actual color is resolved from the current `Theme` injected in the environment via `ThemeProvider`.
///
/// Example usage:
/// ```swift
/// ThemedShape(shape: Circle(), color: .accent)
///     .frame(width: 50, height: 50)
/// ```
///
/// - Note: Ensure the view hierarchy is wrapped in a `ThemeProvider` so the `theme` environment is properly available.
public struct ThemedShape<S: Shape>: View {

  /// Accesses the current `Theme` from the environment.
  @Environment(\.appTheme) private var theme

  /// The SwiftUI shape to render, such as `Circle`, `RoundedRectangle`, etc.
  public let shape: S

  /// The color token to apply to the shape’s fill, resolved from the theme.
  public let color: ColorToken

  /// The content and behavior of the `ThemedShape` view.
  public var body: some View {
    shape.fill(theme.colors[color])
  }
}
