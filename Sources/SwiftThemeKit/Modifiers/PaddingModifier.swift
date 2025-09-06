import SwiftUI

/// A view modifier that applies theme-based padding to specified edges of a view using a spacing token.
///
/// This modifier helps ensure consistent spacing throughout the UI by relying on the design system’s spacing scale.
///
/// ### Example:
/// ```swift
/// Text("Hello")
///   .modifier(PaddingModifier(edges: .horizontal, token: .md))
/// ```
///
/// - Parameters:
///   - edges: The set of edges (`.top`, `.horizontal`, `.all`, etc.) to apply the padding to.
///   - token: A `SpacingToken` representing the spacing size from the current theme (e.g., `.sm`, `.md`, `.lg`).
struct PaddingModifier: ViewModifier {
  /// Accesses the current theme's spacing scale from the environment.
  @Environment(\.appTheme) private var theme

  /// The edges where padding should be applied.
  let edges: Edge.Set

  /// The token representing the spacing value from the theme.
  let token: SpacingToken

  func body(content: Content) -> some View {
    content.padding(edges, theme.spacing[token])
  }
}
