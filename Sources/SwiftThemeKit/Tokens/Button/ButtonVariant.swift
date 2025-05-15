import SwiftUI

/// Defines the visual style variants available for themed buttons.
///
/// `ButtonVariant` determines the background, border, and elevation behavior
/// of a button in combination with its role (e.g., `.destructive`).
public enum ButtonVariant {
  
  /// A solid-filled button. Most prominent and commonly used for primary actions.
  case filled
  
  /// A tonal button with background color and no elevation or border.
  /// Usually a softer alternative to `.filled`, often using a container color.
  case tonal
  
  /// A button with an outlined border and no background fill.
  /// Best suited for secondary or tertiary actions.
  case outline
  
  /// A lightly elevated button with a subtle background and shadow.
  /// Designed for medium emphasis actions that still need visual lift.
  case elevated
  
  /// A minimal button with no background, border, or elevation.
  /// Best used for inline or low-emphasis actions.
  case text
  
  /// Determines the border color to apply based on the variant and button role.
  ///
  /// - Parameters:
  ///   - theme: The current `Theme` instance, which provides color tokens.
  ///   - role: An optional `ButtonRole` such as `.destructive`, which can override styling.
  /// - Returns: A `Color` to use as the button's border.
  public func borderColor(for theme: Theme, role: ButtonRole? = nil) -> Color {
    let isDestructive = role == .destructive
    switch self {
    case .filled, .tonal, .elevated, .text:
      return .clear
    case .outline:
      return isDestructive ? theme.colors.error : theme.colors.primary
    }
  }
}
