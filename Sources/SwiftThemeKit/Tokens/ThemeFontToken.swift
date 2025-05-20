import SwiftUI

/// A font descriptor that combines a text style token with an optional font weight override.
///
/// `ThemeFontToken` is used throughout SwiftThemeKit to describe typography in a flexible,
/// composable way. It allows developers to define a `TextStyleToken` from the theme and
/// optionally override its weight (e.g., make `.bodyMedium` semibold).
///
/// This type is used in components like buttons, text fields, and custom views to centralize
/// font styling and resolve it consistently from the current theme.
public struct ThemeFontToken {

  /// The base typography style from the theme, such as `.bodyMedium`, `.headlineSmall`, etc.
  public let style: TextStyleToken

  /// An optional override for the font weight (e.g., `.regular`, `.semibold`, `.bold`).
  ///
  /// If `nil`, the default weight from the theme’s `TextStyleToken` will be used.
  public let weight: Font.Weight?

  /// Initializes a new `ThemeFontToken` with a text style and optional weight override.
  ///
  /// - Parameters:
  ///   - style: The text style token from the theme.
  ///   - weight: An optional font weight override.
  public init(_ style: TextStyleToken, weight: Font.Weight? = nil) {
    self.style = style
    self.weight = weight
  }
}
