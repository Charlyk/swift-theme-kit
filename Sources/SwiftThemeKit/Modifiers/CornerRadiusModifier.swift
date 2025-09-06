import SwiftUI

/// A view modifier that applies a corner radius to a view using a radius token defined in the current theme.
///
/// This modifier reads a `RadiusToken` and retrieves the corresponding corner radius from the theme's radii scale.
///
/// ### Example:
/// ```swift
/// Text("Hello, World!")
///   .modifier(CornerRadiusModifier(token: .md))
/// ```
///
/// - Parameters:
///   - token: A `RadiusToken` representing the desired corner radius (e.g., `.xs`, `.md`, `.xl`) defined in the theme.
struct CornerRadiusModifier: ViewModifier {
  /// Accesses the current theme from the environment.
  @Environment(\.appTheme) private var theme

  /// The token used to determine the corner radius from the theme.
  let token: RadiusToken

  func body(content: Content) -> some View {
    content.cornerRadius(theme.radii[token])
  }
}
