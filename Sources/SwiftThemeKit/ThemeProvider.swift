import SwiftUI

/// A SwiftUI view that injects a visual theme (`Theme`) into the environment based on the system color scheme.
///
/// Use `ThemeProvider` to wrap your app or specific view hierarchies and enable access to the current theme
/// via `@Environment(\.appTheme)`. It automatically switches between light and dark theme variants.
public struct ThemeProvider<Content: View>: View {

  /// Reads the system color scheme (light or dark).
  @Environment(\.colorScheme) var colorScheme

  /// The theme used when the system is in light mode.
  public let lightTheme: Theme

  /// The theme used when the system is in dark mode.
  public let darkTheme: Theme

  /// The content view to wrap in the themed environment.
  public let content: () -> Content

  /// Initializes a `ThemeProvider` with optional light and dark themes.
  ///
  /// - Parameters:
  ///   - light: The theme to apply in light mode. Defaults to `.defaultLight`.
  ///   - dark: The theme to apply in dark mode. Defaults to `.defaultDark`.
  ///   - content: The root view that will inherit the themed environment.
  public init(
    light: Theme = .defaultLight,
    dark: Theme = .defaultDark,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.lightTheme = light
    self.darkTheme = dark
    self.content = content
  }

  /// The view body that injects the current theme into the environment
  /// based on the active color scheme.
  public var body: some View {
    Group {
      if colorScheme == .dark {
        content()
          .transition(.opacity)
          .tint(lightTheme.colors.primary)
          .environment(\.appTheme, darkTheme)
      } else {
        content()
          .transition(.opacity)
          .tint(lightTheme.colors.primary)
          .environment(\.appTheme, lightTheme)
      }
    }
    .animation(.easeInOut, value: colorScheme)
  }
}
