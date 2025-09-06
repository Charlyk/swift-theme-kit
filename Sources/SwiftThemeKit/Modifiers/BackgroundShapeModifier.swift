import SwiftUI

/// A view modifier that applies a themed background shape from the `ShapeToken` system.
///
/// This modifier reads the current `Theme` from the environment and applies the color
/// associated with the provided `ColorToken`. Optionally, it can extend the background color
/// to ignore specific safe area edges.
///
/// ### Usage:
/// ```swift
/// Text("Hello")
///   .modifier(BackgroundModifier(token: .surface, edgesIgnoringSafeArea: .all))
/// ```
///
/// - Parameters:
///   - token: A `ColorToken` representing the semantic background color (e.g. `.surface`, `.background`, etc.).
///   - edgesIgnoringSafeArea: Optional. A set of edges (e.g. `.all`, `.top`) to extend the background beyond the safe area.
struct BackgroundShapeModifier: ViewModifier {
  /// The current theme pulled from the environment.
  @Environment(\.appTheme) private var theme

  /// The semantic shape token used to resolve the background color.
  let token: ShapeToken

  /// The semantic color token used to resolve the background color.
  let colorToken: ColorToken?

  /// Optional set of edges to ignore safe area insets for the background color.
  let edgesIgnoringSafeArea: Edge.Set?

  func body(content: Content) -> some View {
    if let edgesIgnoringSafeArea {
      content.background(
        theme.shapes[token]
          .if(colorToken != nil) { $0.fill(theme.colors[colorToken!]) }
          .edgesIgnoringSafeArea(edgesIgnoringSafeArea)
      )
    } else {
      content.background(
        theme.shapes[token]
          .if(colorToken != nil) { $0.fill(theme.colors[colorToken!]) }
      )
    }
  }
}
