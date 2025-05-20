import SwiftUI

/// Defines the available visual style variants for themed buttons in SwiftThemeKit.
///
/// `ButtonVariant` controls the button's background, foreground, border, and elevation behavior
/// in conjunction with its semantic role (such as `.destructive`) and pressed state.
///
/// These variants can be configured per button using `.buttonVariant(_)` or via
/// `Theme.buttons.variant` for global defaults.
public enum ButtonVariant {

  /// A solid-filled button.
  ///
  /// - Appearance: Prominent background, high contrast foreground, no border.
  /// - Use case: Primary call-to-action buttons (e.g. "Continue", "Submit").
  case filled

  /// A button with a soft background and no elevation or border.
  ///
  /// - Appearance: Typically uses a secondary container color.
  /// - Use case: Secondary actions with visual grouping (e.g. cards, forms).
  case tonal

  /// A button with a border and no background fill.
  ///
  /// - Appearance: Transparent background, 1pt border.
  /// - Use case: Tertiary or optional actions, often used in inline layouts.
  case outline

  /// A lightly elevated button with a subtle shadow and surface background.
  ///
  /// - Appearance: Surface-tinted background with elevation; no border.
  /// - Use case: Medium-emphasis actions that need visual lift but not full prominence.
  case elevated

  /// A minimal button with no background, border, or elevation.
  ///
  /// - Appearance: Text only.
  /// - Use case: Inline or low-emphasis actions (e.g. "Cancel", links).
  case text

  // MARK: - Internal Styling Logic

  /// Resolves the border color based on the current variant, theme, and role.
  ///
  /// - Parameters:
  ///   - theme: The current `Theme` instance.
  ///   - role: Optional `ButtonRole` (e.g., `.destructive`) that may override styling.
  ///   - overrideColor: An optional color override that takes precedence.
  /// - Returns: The resolved border color.
  func borderColor(for theme: Theme, role: ButtonRole? = nil, overrideColor: Color? = nil) -> Color {
    if let overrideColor {
      return overrideColor
    }

    let isDestructive = role == .destructive

    switch self {
    case .filled, .tonal, .elevated, .text:
      return .clear
    case .outline:
      return isDestructive ? theme.colors.error : theme.colors.primary
    }
  }

  /// Resolves the background color based on the current variant, theme, role, and pressed state.
  ///
  /// - Parameters:
  ///   - theme: The current `Theme` instance.
  ///   - isPressed: Indicates if the button is currently pressed.
  ///   - role: Optional `ButtonRole` (e.g., `.destructive`) that may override styling.
  ///   - overrideColor: An optional override for the background color.
  /// - Returns: The resolved background color.
  func backgroundColor(
    for theme: Theme,
    isPressed: Bool = false,
    role: ButtonRole? = nil,
    overrideColor: Color? = nil
  ) -> Color {
    if let overrideColor {
      return overrideColor
    }

    let isDestructive = role == .destructive

    switch self {
    case .filled:
      let base = isDestructive ? theme.colors.error : theme.colors.primary
      return isPressed ? base.lighten(by: 0.1) : base

    case .tonal:
      let base = isDestructive ? theme.colors.errorContainer : theme.colors.secondaryContainer
      return isPressed ? base.lighten(by: 0.1) : base

    case .outline:
      let pressed = isDestructive
        ? theme.colors.error.opacity(0.05)
        : theme.colors.primary.opacity(0.05)
      return isPressed ? pressed : .clear

    case .elevated:
      return isPressed
        ? theme.colors.surfaceContainerLow.darken(by: 0.1)
        : theme.colors.surfaceContainerLow

    case .text:
      return .clear
    }
  }

  /// Resolves the foreground color (text/icon) for the button based on theme and role.
  ///
  /// - Parameters:
  ///   - theme: The current `Theme` instance.
  ///   - role: Optional `ButtonRole` (e.g., `.destructive`) that may override styling.
  ///   - overrideColor: An optional override for the foreground color.
  /// - Returns: The resolved foreground color.
  func foregroundColor(
    for theme: Theme,
    role: ButtonRole? = nil,
    overrideColor: Color? = nil
  ) -> Color {
    if let overrideColor {
      return overrideColor
    }

    let isDestructive = role == .destructive

    switch self {
    case .filled:
      return isDestructive ? theme.colors.onError : theme.colors.onPrimary
    case .tonal:
      return isDestructive ? theme.colors.onErrorContainer : theme.colors.onSecondaryContainer
    case .outline:
      return isDestructive ? theme.colors.error : theme.colors.onSurfaceVariant
    case .elevated:
      return isDestructive ? theme.colors.error : theme.colors.primary
    case .text:
      return isDestructive ? theme.colors.error : theme.colors.primary
    }
  }
}
