import SwiftUI

public extension ThemeRadii {
  /// Returns a new `ThemeRadii` instance by copying the current one and applying the specified overrides.
  ///
  /// Only parameters you pass will be changed — others will retain their existing values.
  ///
  /// - Parameters:
  ///   - xs: Override for the extra small radius token.
  ///   - sm: Override for the small radius token.
  ///   - md: Override for the medium radius token.
  ///   - lg: Override for the large radius token.
  ///   - xl: Override for the extra large radius token.
  ///   - pill: Override for the pill radius token.
  /// - Returns: A new `ThemeRadii` instance with the applied overrides.
  func copy(
    xs: CGFloat? = nil,
    sm: CGFloat? = nil,
    md: CGFloat? = nil,
    lg: CGFloat? = nil,
    xl: CGFloat? = nil,
    pill: CGFloat? = nil
  ) -> ThemeRadii {
    ThemeRadii(
      xs: xs ?? self.xs,
      sm: sm ?? self.sm,
      md: md ?? self.md,
      lg: lg ?? self.lg,
      xl: xl ?? self.xl,
      pill: pill ?? self.pill
    )
  }
}
