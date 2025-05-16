import SwiftUI

public struct RadioButton<T: Hashable>: View {
  @Environment(\.appTheme) private var theme
  @Binding var selection: T
  let value: T
  private var label: AnyView?
  private var labelPosition: HorizontalPosition = .trailing

  public init(selection: Binding<T>,
              value: T,
              labelPosition: HorizontalPosition = .trailing) {
    self._selection = selection
    self.value = value
    self.label = nil
    self.labelPosition = labelPosition
  }

  public init<Label: View>(selection: Binding<T>,
                           value: T,
                           labelPosition: HorizontalPosition = .trailing,
                           @ViewBuilder label: @escaping () -> Label) {
    self._selection = selection
    self.value = value
    self.labelPosition = labelPosition
    self.label = AnyView(label())
  }

  public var body: some View {
    Button(action: {
      selection = value
    }) {
      HStack(spacing: theme.spacing.sm) {
        if let label, labelPosition == .leading {
          label
            .foregroundColor(theme.colors.onSurface)

          Spacer()
        }

        ZStack {
          Circle()
            .strokeBorder(selection == value ? theme.colors.primary : theme.colors.outline, lineWidth: theme.stroke.sm)
            .frame(width: 24, height: 24)

          if selection == value {
            Circle()
              .fill(theme.colors.primary)
              .frame(width: 12, height: 12)
          }
        }

        if let label, labelPosition == .trailing {
          label
            .foregroundColor(theme.colors.onSurface)

          Spacer()
        }
      }
      .frame(maxWidth: .infinity)
    }
    .buttonStyle(.plain)
  }
}
