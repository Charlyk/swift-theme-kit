import SwiftUI

/// A minimal button style that applies only a themed font and foreground color, without background or padding.
///
/// `PlainTextButtonStyle` is useful for links, plain text interactions, or text-only buttons
/// where you want to preserve the layout and keep the button visually minimal.
///
/// It supports:
/// - Themed typography using `ThemeFontToken`
/// - Color changes on press (darkens the color)
/// - Destructive role styling (uses the theme’s `error` color)
///
/// ### Example:
/// ```swift
/// Button("Delete") { ... }
///   .buttonStyle(PlainTextButtonStyle(token: ThemeFontToken(.labelMedium, weight: .medium)))
/// ```
///
/// You can also use the `.plainTextButton()` modifier from your SDK for convenience.
///
/// - Parameters:
///   - token: A `ThemeFontToken` containing the text style and optional weight to apply.
struct PlainTextButtonStyle: ButtonStyle {
  /// Access to the current app theme.
  @Environment(\.appTheme) private var theme

  /// Access to the button's enabled/disabled state.
  @Environment(\.isEnabled) private var isEnabled

  /// The typography token (style + optional weight) to apply.
  let token: ThemeFontToken

  init(token: ThemeFontToken) {
    self.token = token
  }

  func makeBody(configuration: Configuration) -> some View {
    let isPressed = configuration.isPressed
    let isDestructive = configuration.role == .destructive

    // Choose the correct foreground color
    let fgColor: Color = isDestructive ? theme.colors.error : theme.colors.primary
    let effectiveFgColor = isPressed ? fgColor.darken(by: 0.1) : fgColor

    return configuration.label
      .font(token.style, weight: token.weight)
      .foregroundColor(effectiveFgColor)
      .padding(0)
      .environment(\.typographyStyle, token)
  }
}
