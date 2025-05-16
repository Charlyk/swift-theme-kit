import SwiftUI

/// A customizable radio button component that conforms to the current `Theme`.
///
/// `RadioButton` supports generic `Hashable` values and automatically updates the selected value.
/// You can display a custom label on either side of the button.
///
/// Example:
/// ```swift
/// RadioButton(selection: $selectedOption, value: .optionA, labelPosition: .trailing) {
///   Text("Option A")
/// }
/// ```
public struct RadioButton<T: Hashable>: View {
  @Environment(\.appTheme) private var theme

  /// The currently selected value bound to a parent state.
  @Binding var selection: T

  /// The value represented by this individual radio button.
  let value: T

  /// Optional label content displayed alongside the radio button.
  private var label: AnyView?

  /// Determines whether the label appears on the leading or trailing side.
  private var labelPosition: HorizontalPosition = .trailing

  /// Initializes a radio button without a label.
  ///
  /// - Parameters:
  ///   - selection: A binding to the currently selected value.
  ///   - value: The value this radio button represents.
  ///   - labelPosition: The side on which the label should appear (defaults to `.trailing`).
  public init(selection: Binding<T>,
              value: T,
              labelPosition: HorizontalPosition = .trailing) {
    self._selection = selection
    self.value = value
    self.label = nil
    self.labelPosition = labelPosition
  }

  /// Initializes a radio button with a custom label view.
  ///
  /// - Parameters:
  ///   - selection: A binding to the currently selected value.
  ///   - value: The value this radio button represents.
  ///   - labelPosition: The side on which the label should appear (defaults to `.trailing`).
  ///   - label: A view builder providing the label content.
  public init<Label: View>(selection: Binding<T>,
                           value: T,
                           labelPosition: HorizontalPosition = .trailing,
                           @ViewBuilder label: @escaping () -> Label) {
    self._selection = selection
    self.value = value
    self.labelPosition = labelPosition
    self.label = AnyView(label())
  }

  /// The visual body of the radio button view.
  ///
  /// It displays a circle with an optional filled inner circle if selected,
  /// along with optional label content.
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
            .strokeBorder(
              selection == value ? theme.colors.primary : theme.colors.outline,
              lineWidth: theme.stroke.sm
            )
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
