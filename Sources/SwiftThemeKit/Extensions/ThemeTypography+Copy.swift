import SwiftUI

public extension ThemeTypography {
  /// Returns a new `ThemeTypography` instance by copying the current one
  /// and overriding the specified text styles.
  ///
  /// Only provided parameters will be changed; all others will retain their existing values.
  ///
  /// - Parameters:
  ///   - displayLarge: Override for `displayLarge`
  ///   - displayMedium: Override for `displayMedium`
  ///   - displaySmall: Override for `displaySmall`
  ///   - headlineLarge: Override for `headlineLarge`
  ///   - headlineMedium: Override for `headlineMedium`
  ///   - headlineSmall: Override for `headlineSmall`
  ///   - titleLarge: Override for `titleLarge`
  ///   - titleMedium: Override for `titleMedium`
  ///   - titleSmall: Override for `titleSmall`
  ///   - labelLarge: Override for `labelLarge`
  ///   - labelMedium: Override for `labelMedium`
  ///   - labelSmall: Override for `labelSmall`
  ///   - bodyLarge: Override for `bodyLarge`
  ///   - bodyMedium: Override for `bodyMedium`
  ///   - bodySmall: Override for `bodySmall`
  ///   - buttonText: Override for `buttonText`
  /// - Returns: A new `ThemeTypography` with applied overrides.
  func copy(
    displayLarge: Font? = nil,
    displayMedium: Font? = nil,
    displaySmall: Font? = nil,
    headlineLarge: Font? = nil,
    headlineMedium: Font? = nil,
    headlineSmall: Font? = nil,
    titleLarge: Font? = nil,
    titleMedium: Font? = nil,
    titleSmall: Font? = nil,
    labelLarge: Font? = nil,
    labelMedium: Font? = nil,
    labelSmall: Font? = nil,
    bodyLarge: Font? = nil,
    bodyMedium: Font? = nil,
    bodySmall: Font? = nil,
    buttonText: Font? = nil
  ) -> ThemeTypography {
    ThemeTypography(
      displayLarge: displayLarge ?? self.displayLarge,
      displayMedium: displayMedium ?? self.displayMedium,
      displaySmall: displaySmall ?? self.displaySmall,
      
      headlineLarge: headlineLarge ?? self.headlineLarge,
      headlineMedium: headlineMedium ?? self.headlineMedium,
      headlineSmall: headlineSmall ?? self.headlineSmall,
      
      titleLarge: titleLarge ?? self.titleLarge,
      titleMedium: titleMedium ?? self.titleMedium,
      titleSmall: titleSmall ?? self.titleSmall,
      
      labelLarge: labelLarge ?? self.labelLarge,
      labelMedium: labelMedium ?? self.labelMedium,
      labelSmall: labelSmall ?? self.labelSmall,
      
      bodyLarge: bodyLarge ?? self.bodyLarge,
      bodyMedium: bodyMedium ?? self.bodyMedium,
      bodySmall: bodySmall ?? self.bodySmall,
      
      buttonText: buttonText ?? self.buttonText
    )
  }
}
