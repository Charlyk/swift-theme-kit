import SwiftUI
import SwiftThemeKit

struct ColorsView: View {
  @Environment(\.appTheme) private var theme

  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Colors")
          .font(.headlineLarge)

        ForEach(ColorToken.allCases, id: \.rawValue) { token in
          HStack {
            Text(token.rawValue)
              .font(.bodyMedium)

            Spacer()

            RoundedRectangle(cornerRadius: theme.radii.md)
              .fill(token)
              .size(40)
          }
          .fillMaxWidth()
          .frame(height: 40)
        }
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  ScrollView {
    ColorsView()
      .padding(.md)
  }
}
