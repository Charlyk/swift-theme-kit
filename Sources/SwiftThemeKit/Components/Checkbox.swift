import SwiftUI

public struct Checkbox: View {
  @Environment(\.appTheme) var theme
  @Binding var isChecked: Bool
  private var label: AnyView?
  private var shape: CheckboxShape = .rounded

  public init(isChecked: Binding<Bool>) {
    self._isChecked = isChecked
    self.label = nil
  }

  public init<Label: View>(isChecked: Binding<Bool>,
                           @ViewBuilder label: @escaping () -> Label) {
    self._isChecked = isChecked
    self.label = AnyView(label())
  }

  public var body: some View {
    Button(action: {
      isChecked.toggle()
    }) {
      HStack(spacing: 0) {
        Image(systemName: isChecked ? "checkmark" : "")
          .frame(width: 24, height: 24)
          .foregroundColor(.white)
          .if(isChecked) {
            $0.background(theme.colors.primary)
          }
          .clipShape(shape.shape(theme: theme))
          .background(
            shape.shape(theme: theme)
              .stroke(theme.colors.primary, lineWidth: theme.stroke.sm)
          )

        if let label {
          label
        }
      }
    }
    .buttonStyle(.plain)
  }
}

#Preview {
  Checkbox(isChecked: .constant(true)) {
    Text("Checked checkbox")
      .font(.bodyMedium)
      .padding(.leading, 4)
  }

  Checkbox(isChecked: .constant(false)) {
    Text("Unchecked checkbox")
      .font(.bodyMedium)
      .padding(.leading, 4)
  }
}
