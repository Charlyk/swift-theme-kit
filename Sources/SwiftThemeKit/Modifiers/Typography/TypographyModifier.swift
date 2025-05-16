import SwiftUI

struct TypographyModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  let token: ThemeFontToken
  
  func body(content: Content) -> some View {
    let baseFont = theme.typography[token.style]
    if let weight = token.weight {
#if canImport(UIKit)
      if #available(iOS 16.0, *), #available(tvOS 16.0, *) {
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
