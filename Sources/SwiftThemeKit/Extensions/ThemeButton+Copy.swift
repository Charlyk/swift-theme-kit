import SwiftUI

public extension ThemeButtonDefaults {
  /// Returns a new `ThemeSpacing` instance by copying the current one
  /// and applying the specified overrides.
  ///
  /// Only the parameters you pass will be changed; others retain their original values.
  ///
  /// - Parameters:
  ///   - shape: Optional override for buttons default shape.
  ///   - size: Optional override for buttons default size.
  ///   - variant: Optional override for buttons default variant.
  /// - Returns: A new `ThemeSpacing` instance with the applied overrides.
  func copy(
    shape: ButtonShape? = nil,
    size: ButtonSize? = nil,
    variant: ButtonVariant? = nil
  ) -> ThemeButtonDefaults {
    ThemeButtonDefaults(
      shape: shape ?? self.shape,
      size: size ?? self.size,
      variant: variant ?? self.variant
    )
  }
}
