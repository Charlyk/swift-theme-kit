import SwiftUI
import SwiftThemeKit

struct RadioGroupView: View {
  @Environment(\.appTheme) private var theme
  @Binding var shapes: Shapes

  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Radio buttons")
          .font(.headlineLarge)

        RadioGroup(
          selection: $shapes,
          options: Shapes.allCases
        ) { item in
          item.rawValue
        }
      }
    }
  }
}

#Preview {
  RadioGroupView(shapes: .constant(.rectangle))
    .padding(.md)
}
