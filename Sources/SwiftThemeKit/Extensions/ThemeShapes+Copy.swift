import SwiftUI

public extension ThemeShapes {
  /// Returns a new `ThemeShapes` instance by copying the current one
  /// and applying the specified overrides.
  ///
  /// Only parameters you pass will be changed — others will retain existing values.
  func copy(
    xs: RoundedRectangle? = nil,
    sm: RoundedRectangle? = nil,
    md: RoundedRectangle? = nil,
    lg: RoundedRectangle? = nil,
    xl: RoundedRectangle? = nil
  ) -> ThemeShapes {
    ThemeShapes(
      xs: xs ?? self.xs,
      sm: sm ?? self.sm,
      md: md ?? self.md,
      lg: lg ?? self.lg,
      xl: xl ?? self.xl
    )
  }
}
