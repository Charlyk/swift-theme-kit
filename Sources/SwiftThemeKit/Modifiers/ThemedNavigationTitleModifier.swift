import SwiftUI

/// A view modifier that sets a themed navigation title using your design system's typography.
///
/// This modifier allows applying a custom `TextStyleToken` and optional `Font.Weight`
/// to the navigation title in a consistent way across screens.
///
/// - Works with `.navigationBarTitleDisplayMode(.inline)`
/// - Compatible with iOS, macOS, and tvOS
///
/// ### Example:
/// ```swift
/// ContentView()
///   .modifier(ThemedNavigationTitleModifier(title: "Profile", token: .headlineLarge))
/// ```
///
/// - Parameters:
///   - title: The navigation bar title string.
///   - token: The text style token from the theme's typography (e.g. `.headlineLarge`, `.titleMedium`).
///   - weight: Optional override for font weight (e.g. `.bold`, `.semibold`).
public struct ThemedNavigationTitleModifier: ViewModifier {
  /// Injects the current app theme to access typography styles.
  @Environment(\.appTheme) private var theme

  /// The string title to display in the navigation bar.
  let title: String

  /// The typography token defining the base font.
  let token: TextStyleToken

  /// An optional font weight override (e.g. `.semibold`, `.bold`).
  let weight: Font.Weight?

  public func body(content: Content) -> some View {
    let baseFont = theme.typography[token]
    let font = weight.map { baseFont.weight($0) } ?? baseFont

#if os(tvOS)
    return content
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text(title)
            .font(font)
        }
      }
#else
    return content
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text(title)
            .font(font)
        }
      }
#endif
  }
}
