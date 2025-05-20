import SwiftUI
import SwiftThemeKit

struct ButtonsView: View {
  @Environment(\.appTheme) private var theme
  let shapes: Shapes

  var body: some View {
    Card(elevation: .none) {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Buttons")
          .font(.headlineLarge)

        Button {

        } label: {
          Text("Filled button")
        }
        .buttonShape(shapes.buttonShape)
        .buttonSize(.fullWidth)
        .buttonVariant(.filled)

        Button {

        } label: {
          Text("Tonal button")
        }
        .buttonShape(shapes.buttonShape)
        .buttonSize(.fullWidth)
        .buttonVariant(.tonal)

        Button {

        } label: {
          Text("Outlined button")
        }
        .buttonShape(shapes.buttonShape)
        .buttonSize(.fullWidth)
        .buttonVariant(.outline)

        Button {

        } label: {
          Text("Elevated button")
        }
        .buttonShape(shapes.buttonShape)
        .buttonSize(.fullWidth)
        .buttonVariant(.elevated)

        Button {

        } label: {
          Text("Text button")
        }
        .buttonShape(shapes.buttonShape)
        .buttonSize(.fullWidth)
        .buttonVariant(.text)

        Button {

        } label: {
          Text("Custom background")
        }
        .buttonShape(shapes.buttonShape)
        .buttonSize(.fullWidth)
        .buttonVariant(.filled)
        .buttonBackgroundColor(.green)

        Button {

        } label: {
          Text("Plain text button")
        }
        .plainTextButton()
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  ButtonsView(shapes: .rounded)
    .padding(.md)
}
