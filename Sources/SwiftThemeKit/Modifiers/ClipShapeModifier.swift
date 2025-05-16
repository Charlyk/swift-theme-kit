import SwiftUI

/// A view modifier that clips the view using a shape defined in the current theme.
///
/// This modifier uses a `ShapeToken` to retrieve a shape (e.g., rounded rectangles of various sizes)
/// from the `ThemeShapes` and applies it as a clipping mask to the content.
///
/// ### Example:
/// ```swift
/// Image("avatar")
///   .modifier(ClipShapeModifier(token: .md))
/// ```
///
/// - Parameters:
///   - token: A `ShapeToken` representing the shape size (e.g., `.xs`, `.md`, `.xl`) defined in the current theme.
struct ClipShapeModifier: ViewModifier {
  /// Accesses the current theme from the environment.
  @Environment(\.appTheme) private var theme

  /// The shape token used to retrieve the shape from the theme.
  let token: ShapeToken

  func body(content: Content) -> some View {
    content.clipShape(theme.shapes[token])
  }
}
