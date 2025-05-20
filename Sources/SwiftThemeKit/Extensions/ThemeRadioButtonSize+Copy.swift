import Foundation

public extension ThemeRadioButtonSize {
  /// Creates a copy of this `ThemeRadioButtonSize`, optionally replacing one or more size configurations.
  ///
  /// - Parameters:
  ///   - small: An optional new configuration to replace the existing `.small` size. Defaults to `nil`.
  ///   - medium: An optional new configuration to replace the existing `.medium` size. Defaults to `nil`.
  ///   - large: An optional new configuration to replace the existing `.large` size. Defaults to `nil`.
  ///
  /// - Returns: A new `ThemeRadioButtonSize` instance with the specified replacements applied,
  ///            or identical to this instance if no replacements are provided.
  func copy(
    small: RadioButtonConfiguration? = nil,
    medium: RadioButtonConfiguration? = nil,
    large: RadioButtonConfiguration? = nil
  ) -> ThemeRadioButtonSize {
    ThemeRadioButtonSize(
      small: small ?? self.small,
      medium: medium ?? self.medium,
      large: large ?? self.large
    )
  }
}
