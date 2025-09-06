import SwiftUI

public extension ThemeSpacing {
  /// Returns a new `ThemeSpacing` instance by copying the current one
  /// and applying the specified overrides.
  ///
  /// Only the parameters you pass will be changed; others retain their original values.
  ///
  /// - Parameters:
  ///   - xs: Optional override for extra-small spacing.
  ///   - sm: Optional override for small spacing.
  ///   - md: Optional override for medium spacing.
  ///   - lg: Optional override for large spacing.
  ///   - xl: Optional override for extra-large spacing.
  ///   - xxl: Optional override for double-extra-large spacing.
  /// - Returns: A new `ThemeSpacing` instance with the applied overrides.
  func copy(
    xs: CGFloat? = nil,
    sm: CGFloat? = nil,
    md: CGFloat? = nil,
    lg: CGFloat? = nil,
    xl: CGFloat? = nil,
    xxl: CGFloat? = nil
  ) -> ThemeSpacing {
    ThemeSpacing(
      xs: xs ?? self.xs,
      sm: sm ?? self.sm,
      md: md ?? self.md,
      lg: lg ?? self.lg,
      xl: xl ?? self.xl,
      xxl: xxl ?? self.xxl
    )
  }
}
