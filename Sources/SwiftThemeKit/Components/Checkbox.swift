import SwiftUI

/// A custom themed checkbox component that adapts to the current `Theme`.
///
/// `Checkbox` supports both text labels and custom views, as well as configurable shape and label alignment.
/// It is fully accessible and updates the bound `isChecked` state when toggled.
///
/// Example:
/// ```swift
/// Checkbox(isChecked: $isOn, label: "Subscribe to newsletter")
/// ```
///
/// You can also provide a custom view as a label:
/// ```swift
/// Checkbox(isChecked: $isOn) {
///   HStack {
///     Image(systemName: "bell")
///     Text("Notify me")
///   }
/// }
/// ```
public struct Checkbox: View {
  @Environment(\.appTheme) var theme

  /// A binding that reflects whether the checkbox is selected or not.
  @Binding var isChecked: Bool

  /// Label text displayed next to the checkbox.
  private var label: String = ""

  /// Optional label content displayed next to the checkbox. It will replace the `label`.
  private var customLabel: AnyView? = nil

  /// The shape of the checkbox (e.g. `.rounded`, `.square`, `.circle`).
  private var shape: CheckboxShape = .rounded

  /// The size of the checkbox (e.g. `.small`, `.medium`, `.large`).
  private var size: CheckboxSizeToken = .small

  /// Determines whether the label appears on the leading or trailing side.
  private var labelPosition: HorizontalPosition = .trailing

  /// Initializes a standalone checkbox without a label.
  ///
  /// - Parameter isChecked: A binding to the checkbox state.
  /// - Parameter size: The size of the checkbox. Default is `.small`.
  public init(isChecked: Binding<Bool>, size: CheckboxSizeToken = .small) {
    self._isChecked = isChecked
    self.size = size
  }

  /// Initializes a checkbox with a simple string label.
  ///
  /// - Parameters:
  ///   - isChecked: A binding to the checkbox state.
  ///   - label: The text to display next to the checkbox.
  ///   - size: The size of the checkbox. Default is `.small`.
  ///   - labelPosition: Position of the label relative to the checkbox (defaults to `.trailing`).
  public init(isChecked: Binding<Bool>,
              label: String,
              size: CheckboxSizeToken = .small,
              labelPosition: HorizontalPosition = .trailing) {
    self._isChecked = isChecked
    self.labelPosition = labelPosition
    self.size = size
    self.label = label
  }

  /// Initializes a checkbox with a fully custom view label.
  ///
  /// - Parameters:
  ///   - isChecked: A binding to the checkbox state.
  ///   - size: The size of the checkbox. Default is `.small`.
  ///   - labelPosition: Position of the label relative to the checkbox (defaults to `.trailing`).
  ///   - label: A view builder that defines the label content.
  public init<Label: View>(isChecked: Binding<Bool>,
                           size: CheckboxSizeToken = .small,
                           labelPosition: HorizontalPosition = .trailing,
                           @ViewBuilder label: @escaping () -> Label) {
    self._isChecked = isChecked
    self.size = size
    self.labelPosition = labelPosition
    self.customLabel = AnyView(label())
  }

  /// The body of the checkbox view.
  ///
  /// This includes the checkbox shape, checkmark, background fill, and optional label.
  public var body: some View {
    let iconSize = theme.checkboxSize[size].size
    let spacing = theme.spacing[theme.checkboxSize[size].labelSpacing]
    let strokeWidth = theme.stroke[theme.checkboxSize[size].stroke]
    let font = theme.typography[theme.checkboxSize[size].font]

    Button {
      isChecked.toggle()
    } label: {
      HStack(spacing: spacing) {
        if labelPosition == .leading {
          if let customLabel {
            customLabel
          } else {
            Text(label)
              .font(font)
          }

          Spacer()
        }

        ZStack {
          shape.shape(theme: theme)
            .fill(isChecked ? theme.colors.primary : .clear)
          shape.shape(theme: theme)
            .stroke(theme.colors.primary, lineWidth: strokeWidth)
          if isChecked {
            Image(systemName: "checkmark")
              .foregroundColor(theme.colors.onPrimary)
              .font(font)
          }
        }
        .size(iconSize)
        .contentShape(Rectangle())

        if labelPosition == .trailing {
          if let customLabel {
            customLabel
          } else {
            Text(label)
              .font(font)
          }
        }
      }
    }
    .buttonStyle(.plain)
    .contentShape(Rectangle())
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
