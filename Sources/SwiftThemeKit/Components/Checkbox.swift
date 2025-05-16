import SwiftUI

public struct Checkbox: View {
  @Environment(\.appTheme) var theme
  @Binding var isChecked: Bool
  private var label: AnyView?
  private var shape: CheckboxShape = .rounded
  private var labelPosition: HorizontalPosition = .trailing

  public init(isChecked: Binding<Bool>) {
    self._isChecked = isChecked
    self.label = nil
  }

  public init(isChecked: Binding<Bool>,
              label: String,
              labelPosition: HorizontalPosition = .trailing) {
    self._isChecked = isChecked
    self.labelPosition = labelPosition
    self.label = AnyView(
      Text(label)
        .font(.bodyMedium)
    )
  }

  public init<Label: View>(isChecked: Binding<Bool>,
                           labelPosition: HorizontalPosition = .trailing,
                           @ViewBuilder label: @escaping () -> Label) {
    self._isChecked = isChecked
    self.labelPosition = labelPosition
    self.label = AnyView(label())
  }

  public var body: some View {
    Button(action: {
      isChecked.toggle()
    }) {
      if let label, labelPosition == .leading {
        label

        Spacer()
      }

      HStack(alignment: .center, spacing: 0) {
        Image(systemName: isChecked ? "checkmark" : "")
          .frame(width: 24, height: 24)
          .foregroundColor(.white)
          .if(isChecked) {
            $0.background(theme.colors.primary)
          }
          .clipShape(shape.shape(theme: theme))
          .background(
            shape.shape(theme: theme)
              .stroke(theme.colors.primary, lineWidth: theme.stroke.xs)
          )

        if let label, labelPosition == .trailing {
          label
        }
      }
    }
    .buttonStyle(.plain)
  }
}

#Preview {
  VStack(alignment: .leading) {
    Checkbox(isChecked: .constant(true)) {
      Text("Checked checkbox")
        .font(.bodyMedium)
        .padding(.leading, 6)
    }

    Checkbox(isChecked: .constant(false)) {
      Text("Unchecked checkbox")
        .font(.bodyMedium)
        .padding(.leading, 5)
    }

    Checkbox(isChecked: .constant(false),
             label: "Unchecked checkbox",
             labelPosition: .leading)
  }
  .padding(.horizontal, 16)
}
