import SwiftUI

public extension View {
  /// Applies a themed button style with full customization options.
  ///
  /// - Parameters:
  ///   - variant: Visual style of the button (`filled`, `outline`, `tonal`, `text`, `elevated`).
  ///   - shape: Button shape style (`capsule`, `rounded`, `rectangle`, etc.).
  ///   - size: Button size (`small`, `medium`, `large`).
  ///   - type: Semantic meaning (`default`, `danger`, etc.).
  @ViewBuilder
  func applyThemeButtonStyle(
    variant: ButtonVariant = .filled,
    shape: ButtonShape = .capsule,
    size: ButtonSize = .medium,
    type: ButtonType = .default
  ) -> some View {
    self.buttonStyle(
      ThemeButtonStyle(
        variant: variant,
        shape: shape,
        size: size,
        type: type
      )
    )
  }

  /// Applies a default filled button style.
  ///
  /// - Parameters:
  ///   - size: Button size (default is `.medium`).
  ///   - shape: Button shape (default is `.capsule`).
  @ViewBuilder
  func defaultFilledButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .filled, shape: shape, size: size, type: .default)
  }

  /// Applies a danger filled button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func dangerFilledButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .filled, shape: shape, size: size, type: .danger)
  }

  /// Applies a default outlined button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func defaultOutlineButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .outline, shape: shape, size: size, type: .default)
  }

  /// Applies a danger outlined button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func dangerOutlineButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .outline, shape: shape, size: size, type: .danger)
  }

  /// Applies a default tonal button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func defaultTonalButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .tonal, shape: shape, size: size, type: .default)
  }

  /// Applies a danger tonal button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func dangerTonalButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .tonal, shape: shape, size: size, type: .danger)
  }

  /// Applies a default text-only button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func defaultTextButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .text, shape: shape, size: size, type: .default)
  }

  /// Applies a danger text-only button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func dangerTextButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .text, shape: shape, size: size, type: .danger)
  }

  /// Applies a default elevated (shadowed) button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func defaultElevatedButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .elevated, shape: shape, size: size, type: .default)
  }

  /// Applies a danger elevated (shadowed) button style.
  ///
  /// - Parameters:
  ///   - size: Button size.
  ///   - shape: Button shape.
  @ViewBuilder
  func dangerElevatedButtonStyle(
    size: ButtonSize = .medium,
    shape: ButtonShape = .capsule
  ) -> some View {
    self.applyThemeButtonStyle(variant: .elevated, shape: shape, size: size, type: .danger)
  }
}
