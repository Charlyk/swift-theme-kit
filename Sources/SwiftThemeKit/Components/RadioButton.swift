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

  /// Specifies the size of the radio button icon and font.
  private var size: RadioButtonSizeToken = .small

  /// Determines whether the label appears on the leading or trailing side.
  private var labelPosition: HorizontalPosition = .trailing

  /// Initializes a radio button without a label.
  ///
  /// - Parameters:
  ///   - selection: A binding to the currently selected value.
  ///   - value: The value this radio button represents.
  ///   - size: The size of the radio button icon and font.
  ///   - labelPosition: The side on which the label should appear (defaults to `.trailing`).
  public init(selection: Binding<T>,
              value: T,
              size: RadioButtonSizeToken = .small,
              labelPosition: HorizontalPosition = .trailing) {
    self._selection = selection
    self.value = value
    self.label = nil
    self.size = size
    self.labelPosition = labelPosition
  }

  /// Initializes a radio button with a custom label view.
  ///
  /// - Parameters:
  ///   - selection: A binding to the currently selected value.
  ///   - value: The value this radio button represents.
  ///   - size: The size of the radio button icon and font.
  ///   - labelPosition: The side on which the label should appear (defaults to `.trailing`).
  ///   - label: A view builder providing the label content.
  public init<Label: View>(selection: Binding<T>,
                           value: T,
                           size: RadioButtonSizeToken = .small,
                           labelPosition: HorizontalPosition = .trailing,
                           @ViewBuilder label: @escaping () -> Label) {
    self._selection = selection
    self.value = value
    self.size = size
    self.labelPosition = labelPosition
    self.label = AnyView(label())
  }

  /// The visual body of the radio button view.
  ///
  /// It displays a circle with an optional filled inner circle if selected,
  /// along with optional label content.
  public var body: some View {
    let iconSize = theme.radioButtonSize[size].size
    let spacing = theme.spacing[theme.radioButtonSize[size].labelSpacing]
    let strokeWidth = theme.stroke[theme.radioButtonSize[size].stroke]

    Button(action: {
      selection = value
    }) {
      HStack(spacing: spacing) {
        if let label, labelPosition == .leading {
          label
          Spacer()
        }

        ZStack(alignment: .center) {
          Circle()
            .strokeBorder(
              selection == value ? theme.colors.primary : theme.colors.outline,
              lineWidth: strokeWidth
            )
            .size(iconSize)

          if selection == value {
            Circle()
              .fill(theme.colors.primary)
              .size(iconSize / 3)
          }
        }
        .size(iconSize)
        .contentShape(Rectangle())

        if let label, labelPosition == .trailing {
          label
          Spacer()
        }
      }
      .frame(maxWidth: .infinity)
    }
    .buttonStyle(.plain)
  }
}
