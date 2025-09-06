import SwiftUI

/// A view modifier that applies a rounded clipping shape to a view using a semantic radius token from the theme.
///
/// This modifier reads the corner radius value from the current theme's `radii` using a `RadiusToken`,
/// and clips the content with a `RoundedRectangle` using that radius. You can also specify the rounding style.
///
/// ### Example:
/// ```swift
/// Image("profile")
///   .modifier(ClipRadiusModifier(token: .lg))
/// ```
///
/// - Parameters:
///   - token: A `RadiusToken` that corresponds to a semantic radius size (e.g., `.sm`, `.md`, `.lg`) defined in the theme.
///   - style: The corner style to use for the rounded rectangle. Defaults to `.circular`.
struct ClipRadiusModifier: ViewModifier {
  /// Accesses the current theme from the environment.
  @Environment(\.appTheme) private var theme

  /// The semantic token used to retrieve the corner radius from the theme.
  let token: RadiusToken

  /// The corner style used when rendering the rounded rectangle shape. Defaults to `.circular`.
  var style: RoundedCornerStyle = .circular

  func body(content: Content) -> some View {
    content.clipShape(
      RoundedRectangle(cornerRadius: theme.radii[token], style: style)
    )
  }
}
