import SwiftUI
import SwiftThemeKit

enum Shapes: String, Hashable, CaseIterable {
  case rectangle, rounded, capsule

  var buttonShape: ButtonShape {
    switch self {
    case .rectangle:
      return .square
    case .rounded:
      return .rounded
    case .capsule:
      return .capsule
    }
  }

  var textFieldShape: TextFieldShape {
    switch self {
    case .rectangle:
      return .square
    case .rounded:
      return .rounded
    case .capsule:
      return .capsule
    }
  }
}

struct HomeScreenView: View {
  @EnvironmentObject var themeManager: ThemeManager
  @Environment(\.appTheme) private var theme
  @State private var shapes: Shapes = .rounded
  @State private var fieldsValue: String = ""
  @State private var isChecked: Bool = true
  @State private var isOn: Bool = true
  @State private var slider: CGFloat = 0.5

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Welcome to SwiftThemeKit!")
          .font(.displaySmall)

        Toggle("System componets color", isOn: $isOn)

        Slider(value: $slider)

        TypographyView()

        ShapesView()

        ColorsView()

        ShadowsView()

        RadiiView()

        SpacingsView()

        StrokesView()

        ButtonsView(shapes: shapes)

        TextFieldsView(shapes: shapes)

        RadioGroupView(shapes: $shapes)

        CheckboxesView()
      }
      .padding(.md)
      .fillMaxSize()
    }
    .fillMaxSize()
    .backgroundColor(.surface, edgesIgnoringSafeArea: .all)
    .colorSchemeButton(colorScheme: $themeManager.scheme)
  }
}

#Preview {
  HomeScreenView()
    .environmentObject(ThemeManager())
}
