import SwiftUI

public struct ThemedNavigationTitleModifier: ViewModifier {
  @Environment(\.appTheme) private var theme

  let title: String
  let token: TextStyleToken
  let weight: Font.Weight?

  public func body(content: Content) -> some View {
    let baseFont = theme.typography[token]
    let font = weight.map { baseFont.weight($0) } ?? baseFont

#if os(tvOS)
    return content
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text(title)
            .font(font) // or use your theme
        }
      }
#else
    return content
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text(title)
            .font(font) // or use your theme
        }
      }
#endif
  }
}
