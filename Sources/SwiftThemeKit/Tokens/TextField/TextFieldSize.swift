import SwiftUI

/// Represents the size of a text field, affecting both padding and font.
///
/// Use this enum to configure consistent spacing and typography
/// for text fields across your application.
///
/// - Usage:
///   ```swift
///   TextField("Name", text: $name)
///     .textFieldSize(.medium)
///   ```
///
/// Sizes are mapped to tokens defined in your `Theme` for consistent scaling.
public enum TextFieldSize {

  /// A compact text field with smaller padding and font.
  case small

  /// The default size for standard input fields.
  case medium

  /// A large input field typically used in prominent UI sections.
  case large

  /// Returns the padding to apply based on the theme's spacing tokens.
  ///
  /// - Parameter theme: The theme to use for spacing values.
  /// - Returns: EdgeInsets appropriate for the field size.
  public func padding(theme: Theme) -> EdgeInsets {
    switch self {
    case .small:
      return EdgeInsets(
        top: theme.spacing.sm,
        leading: theme.spacing.sm,
        bottom: theme.spacing.sm,
        trailing: theme.spacing.sm
      )
    case .medium:
      return EdgeInsets(
        top: theme.spacing.md,
        leading: theme.spacing.md,
        bottom: theme.spacing.md,
        trailing: theme.spacing.md
      )
    case .large:
      return EdgeInsets(
        top: theme.spacing.lg,
        leading: theme.spacing.lg,
        bottom: theme.spacing.lg,
        trailing: theme.spacing.lg
      )
    }
  }

  /// Returns the corresponding font from the theme based on field size.
  ///
  /// - Parameter theme: The theme to use for typography values.
  /// - Returns: A `Font` appropriate for the field size.
  public func font(theme: Theme) -> Font {
    switch self {
    case .small:
      return theme.typography.bodySmall
    case .medium:
      return theme.typography.bodyMedium
    case .large:
      return theme.typography.bodyLarge
    }
  }
}
