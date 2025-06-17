import SwiftUI

/// A view modifier that applies a themed font style to any view based on a `ThemeFontToken`.
///
/// This modifier looks up the font style from the current theme and optionally applies a
/// specific font weight if one is provided in the token. It supports backward compatibility
/// for iOS, macOS, and tvOS versions prior to when `.fontWeight(_:)` was available as a chained modifier.
///
/// Use this modifier to apply consistent typography styles defined in your theme.
///
/// Example usage:
/// ```swift
/// Text("Hello")
///   .modifier(TypographyModifier(token: ThemeFontToken(.titleMedium, weight: .bold)))
/// ```
struct TypographyModifier: ViewModifier {
  /// The current theme from the environment.
  @Environment(\.appTheme) private var theme

  /// The font token containing the desired style and optional weight.
  let token: ThemeFontToken

  func body(content: Content) -> some View {
    let baseFont = theme.typography[token.style]
    if let weight = token.weight {
#if canImport(UIKit)
      if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *) {
        content
          .font(baseFont)
          .fontWeight(weight)
      } else {
        content.font(baseFont.weight(weight))
      }
#elseif canImport(AppKit)
      if #available(macOS 13.0, *) {
        content
          .font(baseFont)
          .fontWeight(weight)
      } else {
        content.font(baseFont.weight(weight))
      }
#else
      content
#endif
    } else {
      content.font(baseFont)
    }
  }
}
