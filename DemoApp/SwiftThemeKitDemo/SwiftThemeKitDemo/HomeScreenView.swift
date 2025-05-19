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

        buttons

        textFields

        typography

        radioGroup

        customComponents
      }
      .padding(.md)
      .fillMaxSize()
    }
    .fillMaxSize()
    .backgroundColor(.surface, edgesIgnoringSafeArea: .all)
    .colorSchemeButton(colorScheme: $themeManager.scheme)
  }

  private var radioGroup: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Radio buttons")
          .font(.titleLarge)

        RadioGroup(
          selection: $shapes,
          options: Shapes.allCases
        ) { item in
          item.rawValue
        }
      }
    }
  }

  private var buttons: some View {
    Card(elevation: .none) {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Buttons")
          .font(.titleLarge)

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

  private var textFields: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Text fields")
          .font(.titleLarge)

        TextField("Text fields", text: $fieldsValue)
          .textFieldVariant(.outlined)
          .textFieldShape(shapes.textFieldShape)

        TextField("Text fields", text: $fieldsValue)
          .textFieldVariant(.underlined)
          .textFieldShape(shapes.textFieldShape)

        TextField("Text fields", text: $fieldsValue)
          .textFieldVariant(.filled)
          .textFieldShape(shapes.textFieldShape)

        TextField("Text fields", text: $fieldsValue)
          .textFieldVariant(.plain)
          .textFieldShape(shapes.textFieldShape)
      }
    }
  }

  private var customComponents: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Checkboxes")
          .font(.titleLarge)

        Checkbox(
          isChecked: $isChecked,
          label: "Selected checkbox"
        )
        .fillMaxWidth(alignment: .leading)

        Checkbox(
          isChecked: $isChecked,
          label: "Unselected checkbox"
        )
        .fillMaxWidth(alignment: .leading)

        Checkbox(
          isChecked: $isChecked,
          label: "Leading label checkbox",
          labelPosition: .leading
        )
        .fillMaxWidth(alignment: .leading)

        Checkbox(
          isChecked: $isChecked,
          labelPosition: .leading
        ) {
          HStack {
            Image(systemName: "info.circle")

            Text("Custom label checkbox")
              .font(.titleLarge)
          }
        }
        .fillMaxWidth(alignment: .leading)
      }
      .fillMaxWidth()
    }
  }

  private var typography: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Display Large")
          .font(.displayLarge)

        Text("Display Medium")
          .font(.displayMedium)

        Text("Display Small")
          .font(.displaySmall)

        Text("Headline Large")
          .font(.headlineLarge)

        Text("Headline Medium")
          .font(.headlineMedium)

        Text("Headline Small")
          .font(.headlineSmall)

        Text("Title Large")
          .font(.titleLarge)

        Text("Title Medium")
          .font(.titleMedium)

        Text("Title Small")
          .font(.titleSmall)

        Text("Body Large")
          .font(.bodyLarge)

        Text("Body Medium")
          .font(.bodyMedium)

        Text("Body Small")
          .font(.bodySmall)

        Text("Label Large")
          .font(.labelLarge)

        Text("Label Medium")
          .font(.labelMedium)

        Text("Label Small")
          .font(.labelSmall)
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  HomeScreenView()
}
