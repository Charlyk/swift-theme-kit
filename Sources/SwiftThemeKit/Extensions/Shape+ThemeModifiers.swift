import SwiftUI

public extension Shape {
  /// Applies a themed stroke (border) to the current view.
  ///
  /// - Parameters:
  ///   - width: A `StrokeToken` representing the stroke width from the theme.
  ///   - radius: A `RadiusToken` representing the corner radius. Default is `.md`.
  ///   - color: A `ColorToken` for stroke color. Default is `.primary`.
  @ViewBuilder
  func fill(
    _ color: ColorToken
  ) -> some View {
    ThemedShape(shape: self, color: color)
  }
}
