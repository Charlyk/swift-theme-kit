import SwiftUI

/// Represents the visual shape of a button used in themed UI components.
///
/// This enum defines several commonly used button shapes, including:
/// - Square: No rounding.
/// - Rounded: Medium rounding using the theme's default radius.
/// - Capsule: Fully rounded pill shape.
/// - Custom: Developer-defined corner radius.
public enum ButtonShape: Equatable {
  /// A square button with no corner radius.
  case square
  
  /// A rounded button using the theme's medium radius (`ThemeRadii.md`).
  case rounded
  
  /// A capsule-shaped button with fully rounded corners (uses `ThemeRadii.pill`).
  case capsule
  
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
      return theme.radii.md
    case .capsule:
      return theme.radii.pill
    case .custom(let cornerRadius):
      return cornerRadius
    }
  }
  
  /// Returns the corresponding `Shape` for this button shape, wrapped in an `AnyShape`.
  /// - Parameter theme: The theme to resolve radius values for `rounded` and `custom` types.
  /// - Returns: A shape instance to apply to button clip or background.
  func shape(theme: Theme) -> AnyShape {
    switch self {
    case .square:
      return AnyShape(RoundedRectangle(cornerRadius: 0))
    case .rounded:
      return AnyShape(RoundedRectangle(cornerRadius: radius(for: theme)))
    case .capsule:
      return AnyShape(Capsule())
    case .custom:
      return AnyShape(RoundedRectangle(cornerRadius: radius(for: theme)))
    }
  }
  
  /// Custom equality check that treats any two `.custom` shapes as equal,
  /// regardless of the actual radius value.
  public static func == (lhs: ButtonShape, rhs: ButtonShape) -> Bool {
    switch (lhs, rhs) {
    case (.square, .square), (.rounded, .rounded), (.capsule, .capsule), (.custom, .custom):
      return true
    default:
      return false
    }
  }
}

/// A type-erased wrapper for any SwiftUI `Shape`, allowing dynamic shape selection.
///
/// `AnyShape` is useful when shape type needs to be determined at runtime or stored in a property.
struct AnyShape: Shape {
  /// Internal closure used to build a `Path` from a `CGRect`.
  private let pathBuilder: @Sendable (CGRect) -> Path
  
  /// Initializes the wrapper using a concrete `Shape` instance.
  /// - Parameter shape: The shape to wrap.
  public init<S: Shape>(_ shape: S) {
    self.pathBuilder = { rect in
      shape.path(in: rect)
    }
  }
  
  /// Generates the path for the shape in the given rectangle.
  /// - Parameter rect: The bounds in which to draw the shape.
  /// - Returns: A `Path` representing the shape.
  public func path(in rect: CGRect) -> Path {
    pathBuilder(rect)
  }
}
