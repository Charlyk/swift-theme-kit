import SwiftUI
import SwiftThemeKit

struct StrokesView: View {
  @Environment(\.appTheme) private var theme
  
  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Stroke")
          .font(.headlineLarge)

        ForEach(StrokeToken.allCases, id: \.rawValue) { token in
          HStack(spacing: 0) {
            Text(token.rawValue)
              .font(.bodyMedium)
              .foregroundColor(.onSurfaceVariant)
              .padding(.md)
          }
          .fillMaxWidth()
          .stroke(token)
        }
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  StrokesView()
    .padding(.md)
}
