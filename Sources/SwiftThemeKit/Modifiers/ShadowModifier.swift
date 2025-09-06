import SwiftUI

/// A view modifier that applies a themed shadow using a `ShadowToken` from the current design system.
///
/// This helps maintain consistent elevation and shadow styling across the app by relying on pre-defined shadow tokens.
///
/// ### Example:
/// ```swift
/// Card {
///   Text("Elevated")
/// }
/// .modifier(ShadowModifier(token: .md))
/// ```
///
/// - Parameters:
///   - token: A `ShadowToken` that maps to a shadow configuration (color, radius, offset) from the theme.
struct ShadowModifier: ViewModifier {
  /// Accesses the current theme’s shadow definitions.
  @Environment(\.appTheme) private var theme

  /// The shadow token to apply (e.g., `.sm`, `.md`, `.lg`).
  let token: ShadowToken

  func body(content: Content) -> some View {
    let shadow = theme.shadows[token]

    content.shadow(
      color: shadow.color,
      radius: shadow.radius,
      x: shadow.x,
      y: shadow.y
    )
  }
}
