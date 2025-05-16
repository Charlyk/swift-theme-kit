import SwiftUI

/// Represents the visual shape of a button used in themed UI components.
///
/// This enum defines several commonly used button shapes, including:
/// - Square: No rounding.
/// - Rounded: Medium rounding using the theme's default radius.
/// - Capsule: Fully rounded pill shape.
/// - Custom: Developer-defined corner radius.
public enum CheckboxShape: Equatable {
  /// A square button with no corner radius.
  case square

  /// A rounded button using the theme's medium radius (`ThemeRadii.md`).
  case rounded

  /// A circle checkbox
  case circle

  /// A custom shape with a specific corner radius.
  /// - Parameter cornerRadius: The radius in points to use.
  case custom(cornerRadius: CGFloat)

  /// Resolves the numeric corner radius based on the selected shape and current theme.
  /// - Parameter theme: The theme from which to pull radius values.
  /// - Returns: A `CGFloat` representing the radius to apply.
  public func radius(for theme: Theme) -> CGFloat {
    switch self {
    case .square:
      return .zero
    case .rounded:
      return theme.radii.xs
    case .circle:
      return 9999
    case .custom(let cornerRadius):
      return cornerRadius
    }
  }

  /// Returns the corresponding `Shape` for this button shape, wrapped in an `AnyShape`.
  /// - Parameter theme: The theme to resolve radius values for `rounded` and `custom` types.
  /// - Returns: A shape instance to apply to button clip or background.
  func shape(theme: Theme) -> AnyShape {
    switch self {
    case .rounded, .custom, .circle, .square:
      return AnyShape(RoundedRectangle(cornerRadius: radius(for: theme)))
    }
  }

  /// Custom equality check that treats any two `.custom` shapes as equal,
  /// regardless of the actual radius value.
  public static func == (lhs: CheckboxShape, rhs: CheckboxShape) -> Bool {
    switch (lhs, rhs) {
    case (.square, .square), (.rounded, .rounded), (.custom, .custom):
      return true
    default:
      return false
    }
  }
}
