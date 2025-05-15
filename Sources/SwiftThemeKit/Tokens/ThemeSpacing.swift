import SwiftUI

/// Defines the standard spacing scale for layout and padding/margin values throughout the app.
public struct ThemeSpacing {
  /// Extra-small spacing. Used for tight gaps between small elements like icons or labels.
  public let xs: CGFloat    // 4pt
  
  /// Small spacing. Typically used for padding inside buttons, cards, or input fields.
  public let sm: CGFloat    // 8pt
  
  /// Medium spacing. Ideal for spacing between grouped elements or sections.
  public let md: CGFloat    // 16pt
  
  /// Large spacing. Used for separating components or laying out screen-level spacing.
  public let lg: CGFloat    // 32pt
  
  /// Extra-large spacing. Often used for outer padding or generous layout gaps.
  public let xl: CGFloat    // 48pt
  
  /// Double-extra-large spacing. Reserved for very large vertical spacing or whitespace-heavy layouts.
  public let xxl: CGFloat   // 80pt
  
  /// Default spacing scale based on common design system sizes.
  public static let defaultLight = ThemeSpacing(
    xs: 4,
    sm: 8,
    md: 16,
    lg: 32,
    xl: 48,
    xxl: 80
  )
  
  /// Default spacing scale based on common design system sizes.
  public static let defaultDark = ThemeSpacing(
    xs: 4,
    sm: 8,
    md: 16,
    lg: 32,
    xl: 48,
    xxl: 80
  )
  
  public init(xs: CGFloat, sm: CGFloat, md: CGFloat, lg: CGFloat, xl: CGFloat, xxl: CGFloat) {
    self.xs = xs
    self.sm = sm
    self.md = md
    self.lg = lg
    self.xl = xl
    self.xxl = xxl
  }
  
  subscript(_ token: SpacingToken) -> CGFloat {
    switch token {
    case .xs: return xs
    case .sm: return sm
    case .md: return md
    case .lg: return lg
    case .xl: return xl
    case .xxl: return xxl
    }
  }
}

public enum SpacingToken {
  case xs
  case sm
  case md
  case lg
  case xl
  case xxl
}
