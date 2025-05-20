import SwiftUI
import SwiftThemeKit

struct SpacingsView: View {
  @Environment(\.appTheme) private var theme
  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Spacings")
          .font(.headlineLarge)
        
        ForEach(SpacingToken.allCases, id: \.rawValue) { token in
          HStack(spacing: 0) {
            Text(token.rawValue)
              .font(.bodyMedium)
              .foregroundColor(.onSurfaceVariant)
            
            Text(token.rawValue)
              .font(.bodyMedium)
              .foregroundColor(.onSurfaceVariant)
              .padding(.leading, token)
          }
          .fillMaxWidth()
        }
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  SpacingsView()
    .padding(.md)
}
