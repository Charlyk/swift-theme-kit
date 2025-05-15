import SwiftUI

struct PlainTextButtonStyle: ButtonStyle {
  @Environment(\.appTheme) private var theme
  @Environment(\.isEnabled) private var isEnabled
  let token: ThemeFontToken

  init(token: ThemeFontToken) {
    self.token = token
  }

  func makeBody(configuration: Configuration) -> some View {
    let isPressed = configuration.isPressed
    let isDestructive = configuration.role == .destructive

    let fgColor: Color = isDestructive ? theme.colors.error : theme.colors.primary
    let effectiveFgColor = isPressed ? fgColor.darken(by: 0.1) : fgColor

    return configuration.label
      .font(token.style, weight: token.weight)
      .foregroundColor(effectiveFgColor)
      .padding(0)
      .environment(\.typographyStyle, token)
  }
}
