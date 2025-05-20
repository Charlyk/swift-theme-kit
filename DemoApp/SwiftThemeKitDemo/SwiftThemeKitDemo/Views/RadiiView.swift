import SwiftUI
import SwiftThemeKit

struct RadiiView: View {
  @Environment(\.appTheme) private var theme
  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Radii")
          .font(.headlineLarge)
        
        ForEach(RadiusToken.allCases, id: \.rawValue) { token in
          HStack {
            Text(token.rawValue)
              .font(.bodyMedium)
              .foregroundColor(.onSurfaceVariant)
            
            Spacer()
            
            Rectangle()
              .fill(.primary)
              .size(80)
              .clipRadius(token)
          }
          .fillMaxWidth()
        }
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  RadiiView()
    .padding(.md)
}
