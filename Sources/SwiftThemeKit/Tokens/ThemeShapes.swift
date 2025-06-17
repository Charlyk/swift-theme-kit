import SwiftUI

public struct ThemeShapes: Equatable {
  /// A shape style with 4 same-sized corners smaller than ThemeShapes.sm.
  public let xs: CGFloat

  /// A shape style with 4 same-sized corners bigger than ThemeShapes.xs.
  public let sm: CGFloat

  /// A shape style with 4 same-sized corners bigger than ThemeShapes.sm.
  public let md: CGFloat

  /// A shape style with 4 same-sized corners bigger than ThemeShapes.md.
  public let lg: CGFloat

  /// A shape style with 4 same-sized corners bigger than ThemeShapes.lg.
  public let xl: CGFloat

  public static let defaultLight: ThemeShapes = ThemeShapes(
    xs: ThemeRadii.defaultLight.xs,
    sm: ThemeRadii.defaultLight.sm,
    md: ThemeRadii.defaultLight.md,
    lg: ThemeRadii.defaultLight.lg,
    xl: ThemeRadii.defaultLight.xl
  )

  public static let defaultDark: ThemeShapes = ThemeShapes(
    xs: ThemeRadii.defaultLight.xs,
    sm: ThemeRadii.defaultLight.sm,
    md: ThemeRadii.defaultLight.md,
    lg: ThemeRadii.defaultLight.lg,
    xl: ThemeRadii.defaultLight.xl
  )

  public init(xs: CGFloat, sm: CGFloat, md: CGFloat, lg: CGFloat, xl: CGFloat) {
    self.xs = xs
    self.sm = sm
    self.md = md
    self.lg = lg
    self.xl = xl
  }

  public subscript(_ token: ShapeToken) -> RoundedRectangle {
    switch token {
    case .xs: return RoundedRectangle(cornerRadius: xs)
    case .sm: return RoundedRectangle(cornerRadius: sm)
    case .md: return RoundedRectangle(cornerRadius: md)
    case .lg: return RoundedRectangle(cornerRadius: lg)
    case .xl: return RoundedRectangle(cornerRadius: xl)
    }
  }
}

public enum ShapeToken: String, CaseIterable {
  case xs
  case sm
  case md
  case lg
  case xl
}
