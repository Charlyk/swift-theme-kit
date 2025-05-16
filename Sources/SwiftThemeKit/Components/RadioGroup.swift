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
  /// The binding to the currently selected value.
  @Binding var selection: T

  /// The list of options to present as radio buttons.
  let options: [T]

  /// A closure that returns a label view for each option.
  let labelProvider: (T) -> AnyView

  /// Specifies where the label appears relative to the radio circle.
  var labelPosition: HorizontalPosition = .trailing

  /// Creates a `RadioGroup` with string-based labels.
  ///
  /// - Parameters:
  ///   - selection: Binding to the selected value.
  ///   - options: Array of options to display.
  ///   - labelPosition: Position of label relative to radio (default is `.trailing`).
  ///   - labelProvider: Closure that returns a `String` for each option.
  public init(selection: Binding<T>,
              options: [T],
              labelPosition: HorizontalPosition = .trailing,
              labelProvider: @escaping (T) -> String) {
    self._selection = selection
    self.options = options
    self.labelPosition = labelPosition
    self.labelProvider = {
      AnyView(
        Text(labelProvider($0))
          .font(.bodyMedium)
      )
    }
  }

  /// Creates a `RadioGroup` with custom SwiftUI label views.
  ///
  /// - Parameters:
  ///   - selection: Binding to the selected value.
  ///   - options: Array of options to display.
  ///   - labelPosition: Position of label relative to radio (default is `.leading`).
  ///   - labelProvider: View builder closure that returns a view for each option.
  public init<Label: View>(
    selection: Binding<T>,
    options: [T],
    labelPosition: HorizontalPosition = .trailing,
    @ViewBuilder labelProvider: @escaping (T) -> Label
  ) {
    self._selection = selection
    self.options = options
    self.labelPosition = labelPosition
    self.labelProvider = {
      AnyView(labelProvider($0))
    }
  }

  /// The view body that renders all radio buttons in a vertical layout.
  public var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      ForEach(options, id: \.self) { option in
        RadioButton(selection: $selection, value: option, labelPosition: labelPosition) {
          labelProvider(option)
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
