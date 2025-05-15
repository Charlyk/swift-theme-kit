import SwiftUI

public enum ButtonShape: Equatable {
  case square
  case rounded
  case capsule
  case custom(cornerRadius: CGFloat)
  
  func radius(for theme: Theme) -> CGFloat {
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
  
  public static func == (lhs: ButtonShape, rhs: ButtonShape) -> Bool {
    switch (lhs, rhs) {
    case (.square, .square):
      return true
    case (.rounded, .rounded):
      return true
    case (.capsule, .capsule):
      return true
    case (.custom, .custom):
      return true
    default:
      return false
    }
  }
}

struct AnyShape: Shape {
  private let pathBuilder: @Sendable (CGRect) -> Path
  
  public init<S: Shape>(_ shape: S) {
    self.pathBuilder = { rect in
      shape.path(in: rect)
    }
  }
  
  public func path(in rect: CGRect) -> Path {
    pathBuilder(rect)
  }
}
