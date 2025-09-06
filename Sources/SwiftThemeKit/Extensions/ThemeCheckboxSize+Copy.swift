import Foundation

public extension ThemeCheckboxSize {
  /// Creates a copy of this `ThemeCheckboxSize`, optionally replacing one or more size configurations.
  ///
  /// - Parameters:
  ///   - small: An optional new configuration to replace the existing `.small` size. Defaults to `nil`.
  ///   - medium: An optional new configuration to replace the existing `.medium` size. Defaults to `nil`.
  ///   - large: An optional new configuration to replace the existing `.large` size. Defaults to `nil`.
  ///
  /// - Returns: A new `ThemeCheckboxSize` instance with the specified replacements applied,
  ///            or identical to this instance if no replacements are provided.
  func copy(
    small: CheckboxConfiguration? = nil,
    medium: CheckboxConfiguration? = nil,
    large: CheckboxConfiguration? = nil
  ) -> ThemeCheckboxSize {
    ThemeCheckboxSize(
      small: small ?? self.small,
      medium: medium ?? self.medium,
      large: large ?? self.large
    )
  }
}
