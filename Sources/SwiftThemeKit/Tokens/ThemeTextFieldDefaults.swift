import SwiftUI

public struct ThemeTextFieldDefaults: Equatable {
  /// The default shape of the buttons if no other modifiers applied
  public let shape: TextFieldShape

  /// The default size of the buttons if no other modifiers applied
  public let size: TextFieldSize

  /// The default variant of the buttons if no other modifiers applied
  public let variant: TextFieldVariant

  /// The default configuration for light mode
  public static let defaultLight = ThemeTextFieldDefaults(
    shape: .rounded,
    size: .medium,
    variant: .filled
  )

  /// The default configuration for dark mode
  public static let defaultDark = ThemeTextFieldDefaults(
    shape: .rounded,
    size: .medium,
    variant: .filled
  )

  /// Initialize a new button configuration
  ///
  /// - Parameters:
  ///   - shape: The `TextFieldShape` to be used by default
  ///   - size: The `TextFieldSize` to be used by default
  ///   - variant: The `TextFieldVariant` to be used by default
  public init(shape: TextFieldShape, size: TextFieldSize, variant: TextFieldVariant) {
    self.shape = shape
    self.size = size
    self.variant = variant
  }
}
