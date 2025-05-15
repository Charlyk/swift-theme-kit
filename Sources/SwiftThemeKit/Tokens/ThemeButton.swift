import SwiftUI

public struct ThemeButton {
  let shape: ButtonShape
  let size: ButtonSize
  let variant: ButtonVariant

  public static let defaultLight = ThemeButton(
    shape: .rounded,
    size: .medium,
    variant: .filled
  )

  public static let defaultDark = ThemeButton(
    shape: .rounded,
    size: .medium,
    variant: .filled
  )

  public init(shape: ButtonShape, size: ButtonSize, variant: ButtonVariant) {
    self.shape = shape
    self.size = size
    self.variant = variant
  }
}
