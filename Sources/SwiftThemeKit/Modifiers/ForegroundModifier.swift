import SwiftUI

/// A view modifier that applies a foreground color to a view using a color token from the current theme.
///
/// This is useful for setting text, icon, or other foreground element colors in a consistent and theme-driven way.
///
/// ### Example:
/// ```swift
/// Text("Warning")
///   .modifier(ForegroundModifier(token: .error))
/// ```
///
/// - Parameters:
///   - token: A `ColorToken` representing the desired foreground color from the theme (e.g., `.primary`, `.onSurface`, `.error`).
struct ForegroundModifier: ViewModifier {
  /// Accesses the current theme from the environment.
  @Environment(\.appTheme) private var theme

  /// The color token to apply to the foreground.
  let token: ColorToken

  func body(content: Content) -> some View {
    content.foregroundColor(theme.colors[token])
  }
}
