import SwiftUI

public struct RadioGroup<T: Hashable>: View {
  @Binding var selection: T
  let options: [T]
  let labelProvider: (T) -> AnyView
  var labelPosition: HorizontalPosition = .trailing

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

  public init<Label: View>(
    selection: Binding<T>,
    options: [T],
    labelPosition: HorizontalPosition = .leading,
    @ViewBuilder labelProvider: @escaping (T) -> Label
  ) {
    self._selection = selection
    self.options = options
    self.labelProvider = {
      AnyView(labelProvider($0))
    }
  }

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
