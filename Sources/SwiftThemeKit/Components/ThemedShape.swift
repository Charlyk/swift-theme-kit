import SwiftUI

struct ThemedShape<S: Shape>: View {
  @Environment(\.appTheme) private var theme

  let shape: S
  let color: ColorToken

  var body: some View {
    shape.fill(theme.colors[color])
  }
}
