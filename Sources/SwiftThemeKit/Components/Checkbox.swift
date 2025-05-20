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

  /// Optional label content displayed next to the checkbox.
  private var label: AnyView?

  /// The shape of the checkbox (e.g. `.rounded`, `.square`, `.circle`).
  private var shape: CheckboxShape = .rounded

  /// Determines whether the label appears on the leading or trailing side.
  private var labelPosition: HorizontalPosition = .trailing

  /// Determines the spacing between the checkbox and its label
  private var labelSpacing: SpacingToken = .none

  /// Initializes a standalone checkbox without a label.
  ///
  /// - Parameter isChecked: A binding to the checkbox state.
  public init(isChecked: Binding<Bool>) {
    self._isChecked = isChecked
    self.label = nil
  }

  /// Initializes a checkbox with a simple string label.
  ///
  /// - Parameters:
  ///   - isChecked: A binding to the checkbox state.
  ///   - label: The text to display next to the checkbox.
  ///   - labelPosition: Position of the label relative to the checkbox (defaults to `.trailing`).
  public init(isChecked: Binding<Bool>,
              label: String,
              labelSpacing: SpacingToken = .sm,
              labelPosition: HorizontalPosition = .trailing) {
    self._isChecked = isChecked
    self.labelPosition = labelPosition
    self.labelSpacing = labelSpacing
    self.label = AnyView(
      Text(label)
        .font(.bodyMedium)
    )
  }

  /// Initializes a checkbox with a fully custom view label.
  ///
  /// - Parameters:
  ///   - isChecked: A binding to the checkbox state.
  ///   - labelPosition: Position of the label relative to the checkbox (defaults to `.trailing`).
  ///   - label: A view builder that defines the label content.
  public init<Label: View>(isChecked: Binding<Bool>,
                           labelSpacing: SpacingToken = .sm,
                           labelPosition: HorizontalPosition = .trailing,
                           @ViewBuilder label: @escaping () -> Label) {
    self._isChecked = isChecked
    self.labelSpacing = labelSpacing
    self.labelPosition = labelPosition
    self.label = AnyView(label())
  }

  /// The body of the checkbox view.
  ///
  /// This includes the checkbox shape, checkmark, background fill, and optional label.
  public var body: some View {
    Button {
      isChecked.toggle()
    } label: {
      if let label, labelPosition == .leading {
        label
        Spacer()
      }

      let spacing = theme.spacing[labelSpacing]

      HStack(alignment: .center, spacing: spacing) {
        Image(systemName: isChecked ? "checkmark" : "")
          .frame(width: 24, height: 24)
          .foregroundColor(theme.colors.onPrimary)
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
