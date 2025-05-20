import SwiftUI
import SwiftThemeKit

struct ShadowsView: View {
  @Environment(\.appTheme) private var theme
  
  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.lg) {
        Text("Shadows")
          .font(.headlineLarge)

        ForEach(ShadowToken.allCases, id: \.rawValue) { token in
          HStack {
            Text(token.rawValue)
              .font(.bodyMedium)
              .foregroundColor(.onSurfaceVariant)
          }
          .padding(.md)
          .fillMaxWidth()
          .backgroundShape(.md, color: .secondaryContainer)
          .shadow(token)
        }
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  ShadowsView()
    .padding(.md)
}
