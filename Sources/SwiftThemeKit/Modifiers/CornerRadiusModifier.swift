import SwiftUI

struct CornerRadiusModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  let token: RadiusToken
  
  func body(content: Content) -> some View {
    content.cornerRadius(theme.radii[token])
  }
}
