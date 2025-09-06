import SwiftUI
import SwiftThemeKit

struct ShapesView: View {
  @Environment(\.appTheme) private var theme

    var body: some View {
      Card {
        VStack(alignment: .leading, spacing: theme.spacing.md) {
          Text("Shapes")
            .font(.headlineLarge)

          ForEach(ShapeToken.allCases, id: \.rawValue) { token in
            ZStack {
              Text(token.rawValue)
                .font(.bodyMedium)
                .foregroundColor(.onPrimary)
                .padding(.horizontal, .md)
            }
            .fillMaxWidth()
            .frame(height: 40)
            .backgroundShape(token, color: .primary)
          }
        }
        .fillMaxWidth()
      }
    }
}

#Preview {
    ShapesView()
      .padding(.md)
}
