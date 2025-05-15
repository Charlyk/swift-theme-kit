import SwiftUI

public struct ThemeButtonDefaults {
  /// The default shape of the buttons if no other modifiers applied
  let shape: ButtonShape
  
  /// The default size of the buttons if no other modifiers applied
  let size: ButtonSize
  
  /// The default variant of the buttons if no other modifiers applied
  let variant: ButtonVariant
  
  /// The default configuration for light mode
  public static let defaultLight = ThemeButtonDefaults(
    shape: .rounded,
    size: .medium,
    variant: .filled
  )
  
  /// The default configuration for dark mode
  public static let defaultDark = ThemeButtonDefaults(
    shape: .rounded,
    size: .medium,
    variant: .filled
  )
  
  /// Initialize a new button configuration
  ///
  /// - Parameters:
  ///   - shape: The `ButtonShape` to be used by default
  ///   - size: The `ButtonSize` to be used by default
  ///   - variant: The `ButtonVariant` to be used by default
  public init(shape: ButtonShape, size: ButtonSize, variant: ButtonVariant) {
    self.shape = shape
    self.size = size
    self.variant = variant
  }
}
