import SwiftUI

/// A view modifier that applies a themed stroke (border) using radius, color, and width tokens from the design system.
///
/// This enables consistent styling of outlines or borders across components like buttons, cards, inputs, etc.
///
/// ### Example:
/// ```swift
/// Text("Bordered")
///   .modifier(StrokeModifier(width: .sm))
/// ```
///
/// - Parameters:
///   - width: A `StrokeToken` defining the line thickness (e.g., `.xs`, `.sm`, `.md`).
///   - radius: A `RadiusToken` defining the corner radius of the border. Defaults to `.md`.
///   - color: A `ColorToken` defining the stroke color. Defaults to `.primary`.
struct StrokeModifier: ViewModifier {
  /// Accesses the current theme to retrieve radii, colors, and stroke widths.
  @Environment(\.appTheme) private var theme

  /// Stroke width from the theme (e.g., `.xs`, `.sm`).
  let width: StrokeToken

  /// Corner radius for the stroke's shape. Defaults to `.md`.
  var radius: RadiusToken = .md

  /// Color used for the stroke. Defaults to `.primary`.
  var color: ColorToken = .primary

  func body(content: Content) -> some View {
    content.overlay(
      RoundedRectangle(cornerRadius: theme.radii[radius])
        .stroke(theme.colors[color], lineWidth: theme.stroke[width])
    )
  }
}
