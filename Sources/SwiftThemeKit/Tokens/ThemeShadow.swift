import SwiftUI

/// Defines a shadow style for UI elements, including color, blur radius, and offset values.
/// Used to indicate elevation, depth, or focus across your app.
public struct ThemeShadow: Equatable {
  
  /// The color of the shadow.
  /// Typically black with opacity in light mode or white with opacity in dark mode.
  public let color: Color
  
  /// The blur radius of the shadow.
  /// Larger values create softer, more diffused shadows.
  public let radius: CGFloat
  
  /// The horizontal offset of the shadow.
  /// Positive values move the shadow to the right; negative to the left.
  public let x: CGFloat
  
  /// The vertical offset of the shadow.
  /// Positive values move the shadow down; negative values move it up.
  public let y: CGFloat
  
  /// Initializes a new shadow definition.
  /// - Parameters:
  ///   - color: The shadow color.
  ///   - radius: The blur radius of the shadow.
  ///   - x: Horizontal offset in points.
  ///   - y: Vertical offset in points.
  public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
    self.color = color
    self.radius = radius
    self.x = x
    self.y = y
  }
}
