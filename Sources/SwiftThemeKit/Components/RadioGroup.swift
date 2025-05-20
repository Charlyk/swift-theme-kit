import SwiftUI

/// A vertically stacked group of radio buttons bound to a single selection.
///
/// `RadioGroup` allows presenting multiple options where only one can be selected at a time.
/// It supports both simple `String` labels or custom label views.
///
/// ```swift
/// RadioGroup(selection: $selectedOption, options: MyEnum.allCases) { option in
///     Text(option.rawValue)
/// }
/// ```
public struct RadioGroup<T: Hashable>: View {
  @Environment(\.appTheme) private var theme

  /// The binding to the currently selected value.
  @Binding private var selection: T

  /// Indicates whether a custom label is used for the radio button
  private let usesCustomLabel: Bool

  /// The list of options to present as radio buttons.
  private let options: [T]

  /// A closure that returns a label view for each option.
  private let labelProvider: (T) -> AnyView

  /// Specifies where the label appears relative to the radio circle.
  private var labelPosition: HorizontalPosition = .trailing

  /// Specifies the size of the radio button which controls the size of the icon and the font.
  private var buttonSize: RadioButtonSizeToken = .small

  /// Creates a `RadioGroup` with string-based labels.
  ///
  /// - Parameters:
  ///   - selection: Binding to the selected value.
  ///   - options: Array of options to display.
  ///   - buttonSize: The size of the radio button. Default is `small`.
  ///   - labelPosition: Position of label relative to radio (default is `.trailing`).
  ///   - labelProvider: Closure that returns a `String` for each option.
  public init(
    selection: Binding<T>,
    options: [T],
    buttonSize: RadioButtonSizeToken = .small,
    labelPosition: HorizontalPosition = .trailing,
    labelProvider: @escaping (T) -> String
  ) {
    self._selection = selection
    self.options = options
    self.labelPosition = labelPosition
    self.buttonSize = buttonSize
    self.usesCustomLabel = false
    self.labelProvider = {
      AnyView(
        Text(labelProvider($0))
      )
    }
  }

  /// Creates a `RadioGroup` with custom SwiftUI label views.
  ///
  /// - Parameters:
  ///   - selection: Binding to the selected value.
  ///   - options: Array of options to display.
  ///   - buttonSize: The size of the radio button. Default is `small`.
  ///   - labelPosition: Position of label relative to radio (default is `.leading`).
  ///   - labelProvider: View builder closure that returns a view for each option.
  public init<Label: View>(
    selection: Binding<T>,
    options: [T],
    buttonSize: RadioButtonSizeToken = .small,
    labelPosition: HorizontalPosition = .trailing,
    @ViewBuilder labelProvider: @escaping (T) -> Label
  ) {
    self._selection = selection
    self.options = options
    self.buttonSize = buttonSize
    self.labelPosition = labelPosition
    self.usesCustomLabel = true
    self.labelProvider = {
      AnyView(labelProvider($0))
    }
  }

  /// The view body that renders all radio buttons in a vertical layout.
  public var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      ForEach(options, id: \.self) { option in
        RadioButton(
          selection: $selection,
          value: option,
          size: buttonSize,
          labelPosition: labelPosition
        ) {
          if usesCustomLabel {
            labelProvider(option)
          } else {
            let font = theme.typography[theme.platform.radioButtonFontStyle(for: buttonSize)]

            labelProvider(option)
              .font(font)
          }
        }
      }
    }
  }
}

#Preview {
  VStack {
    RadioGroup(selection: .constant(.paypal), options: PaymentMethod.allCases, labelPosition: .leading) { $0.rawValue }
    RadioGroup(selection: .constant(.paypal), options: PaymentMethod.allCases) {
      Text($0.rawValue)
        .font(.titleLarge)
    }
  }
  .padding(.horizontal, 16)
}

enum PaymentMethod: String, CaseIterable {
  case card = "Credit Card"
  case paypal = "PayPal"
  case applePay = "Apple Pay"
}
