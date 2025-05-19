import SwiftUI
import SwiftThemeKit

struct TextFieldsView: View {
  @Environment(\.appTheme) private var theme
  @State private var fieldsValue: String = ""
  let shapes: Shapes

  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Text fields")
          .font(.headlineLarge)

        TextField("Outlined", text: $fieldsValue)
          .textFieldVariant(.outlined)
          .textFieldShape(shapes.textFieldShape)

        TextField("Underlined", text: $fieldsValue)
          .textFieldVariant(.underlined)
          .textFieldShape(shapes.textFieldShape)

        TextField("Filled", text: $fieldsValue)
          .textFieldVariant(.filled)
          .textFieldShape(shapes.textFieldShape)

        TextField("Plain", text: $fieldsValue)
          .textFieldVariant(.plain)
          .textFieldShape(shapes.textFieldShape)
      }
    }
  }
}

#Preview {
  TextFieldsView(shapes: .rounded)
    .padding(.md)
}
