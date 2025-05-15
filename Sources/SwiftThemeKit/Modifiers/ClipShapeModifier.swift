import SwiftUI

struct ClipShapeModifier: ViewModifier {
  @Environment(\.appTheme) private var theme
  let token: ShapeToken
  
  func body(content: Content) -> some View {
    content.clipShape(theme.shapes[token])
  }
}
