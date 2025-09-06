import SwiftUI

extension View {
  /// Conditionally applies a view transformation when a condition is `true`.
  ///
  /// This is useful for chaining conditional modifiers in a clean and readable way.
  ///
  /// - Parameters:
  ///   - condition: A Boolean value that determines whether the transform is applied.
  ///   - transform: A closure that takes the original view and returns a modified view.
  ///
  /// - Returns: Either the original view or the transformed view if the condition is `true`.
  ///
  /// ### Example:
  /// ```swift
  /// Text("Hello")
  ///   .if(isHighlighted) { $0.foregroundColor(.red) }
  /// ```
  @ViewBuilder
  public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }

  /// Measures the size of the view and writes it to a bound `CGSize`.
  ///
  /// This can be used to capture layout dimensions for alignment, animation,
  /// or dynamic layout decisions.
  ///
  /// - Parameter size: A binding to a `CGSize` value that will be updated with the view’s size.
  ///
  /// ### Example:
  /// ```swift
  /// @State private var size: CGSize = .zero
  ///
  /// Text("Resizable")
  ///   .measure($size)
  ///   .onChange(of: size) { print("New size: \($0)") }
  /// ```
  @ViewBuilder
  public func measure(_ size: Binding<CGSize>) -> some View {
    self.background(
      GeometryReader { proxy in
        Color.clear.onAppear {
          size.wrappedValue = proxy.size
        }
      }
    )
  }
}
