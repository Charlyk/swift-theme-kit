import SwiftUI

/// A collection of predefined shadow styles used to indicate elevation, depth, or focus across the UI.
public struct ThemeShadows {
  
  /// No shadow. Used for flat surfaces and elements that should appear flush with the background.
  public let none: ThemeShadow
  
  /// Small shadow. Typically used for slightly elevated components like input fields or chips.
  public let sm: ThemeShadow
  
  /// Medium shadow. Suitable for cards, modals, and elevated surfaces.
  public let md: ThemeShadow
  
  /// Large shadow. Used for high-elevation components such as floating panels or bottom sheets.
  public let lg: ThemeShadow
  
  /// Focus shadow. Applied to inputs or buttons when they are in a focused or active state.
  public let focus: ThemeShadow
  
  /// Default shadow set optimized for **light mode**. Uses dark shadow colors on light surfaces.
  public static let defaultLight = ThemeShadows(
    sm: ThemeShadow(color: .black.opacity(0.12), radius: 1, x: 0, y: 1),
    md: ThemeShadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 4),
    lg: ThemeShadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 8),
    focus: ThemeShadow(color: ThemeColors.defaultLight.shadow.opacity(0.3), radius: 3, x: 0, y: 0),
    none: ThemeShadow(color: .clear, radius: 0, x: 0, y: 0)
  )
  
  /// Default shadow set optimized for **dark mode**. Uses subtle light shadows to maintain depth.
  public static let defaultDark = ThemeShadows(
    sm: ThemeShadow(color: .white.opacity(0.05), radius: 1, x: 0, y: 1),
    md: ThemeShadow(color: .white.opacity(0.06), radius: 4, x: 0, y: 4),
    lg: ThemeShadow(color: .white.opacity(0.07), radius: 8, x: 0, y: 8),
    focus: ThemeShadow(color: ThemeColors.defaultDark.shadow.opacity(0.3), radius: 3, x: 0, y: 0),
    none: ThemeShadow(color: .clear, radius: 0, x: 0, y: 0)
  )
  
  /// Initializes a custom shadow scale set.
  /// - Parameters:
  ///   - none: Shadow style with no elevation.
  ///   - sm: Small elevation shadow.
  ///   - md: Medium elevation shadow.
  ///   - lg: Large elevation shadow.
  ///   - focus: Shadow used to indicate focus state.
  public init(sm: ThemeShadow,
              md: ThemeShadow,
              lg: ThemeShadow,
              focus: ThemeShadow,
              none: ThemeShadow) {
    self.none = none
    self.sm = sm
    self.md = md
    self.lg = lg
    self.focus = focus
  }
  
  subscript(_ token: ShadowToken) -> ThemeShadow {
    switch token {
    case .none: return none
    case .sm: return sm
    case .md: return md
    case .lg: return lg
    case .focus: return focus
    }
  }
}

public enum ShadowToken: String, CaseIterable {
  case none
  case sm
  case md
  case lg
  case focus
}
