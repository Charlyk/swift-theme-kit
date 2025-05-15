import SwiftUI

/// Defines the size and layout configuration for themed buttons.
///
/// `ButtonSize` controls padding and font size for different button scales.
/// It also supports full-width layout and fully custom styles.
public enum ButtonSize: Equatable {

  /// Small button size. Compact padding and a small font.
  case small

  /// Medium button size. Moderate padding and a larger label font.
  case medium

  /// Large button size. Generous padding and body-level typography.
  case large

  /// Full-width button. Stretches to fill horizontal space.
  /// Padding is applied vertically, and horizontal is handled via `.frame(maxWidth: .infinity)`.
  case fullWidth

  /// A custom button size, allowing full control over both padding and font.
  /// - Parameters:
  ///   - EdgeInsets: The padding to apply.
  ///   - Font: The font to use for the label.
  case custom(EdgeInsets, Font)

  /// Computes the edge insets (padding) to apply for the given button size.
  /// - Parameter theme: The current theme to use for spacing tokens.
  /// - Returns: An `EdgeInsets` value that should be applied to the button.
  public func paddingValues(for theme: Theme) -> EdgeInsets {
    switch self {
    case .small:
      return EdgeInsets(
        top: theme.spacing.sm,
        leading: theme.spacing.md,
        bottom: theme.spacing.sm,
        trailing: theme.spacing.md
      )
    case .medium:
      return EdgeInsets(
        top: theme.spacing.md,
        leading: theme.spacing.lg,
        bottom: theme.spacing.md,
        trailing: theme.spacing.lg
      )
    case .large:
      return EdgeInsets(
        top: theme.spacing.lg,
        leading: theme.spacing.xl,
        bottom: theme.spacing.lg,
        trailing: theme.spacing.xl
      )
    case .fullWidth:
      // Width handled with `.frame(maxWidth: .infinity)`
      return EdgeInsets(
        top: theme.spacing.md,
        leading: .infinity,
        bottom: theme.spacing.md,
        trailing: .infinity
      )
    case .custom(let edgeInsets, _):
      return edgeInsets
    }
  }

  /// Resolves the appropriate font to use based on button size.
  /// - Parameter theme: The theme from which to retrieve font styles.
  /// - Returns: A `Font` appropriate for the current size.
  public func font(for theme: Theme) -> Font {
    switch self {
    case .small:
      return theme.typography.labelSmall
    case .medium:
      return theme.typography.labelLarge
    case .large:
      return theme.typography.bodyMedium
    case .fullWidth:
      return theme.typography.bodyMedium
    case .custom(_, let font):
      return font
    }
  }

  /// Compares two button sizes for equality.
  ///
  /// Note: Custom sizes are treated as equal regardless of their actual content.
  public static func == (lhs: ButtonSize, rhs: ButtonSize) -> Bool {
    switch (lhs, rhs) {
    case (.small, .small),
      (.medium, .medium),
      (.large, .large),
      (.fullWidth, .fullWidth),
      (.custom, .custom):
      return true
    default:
      return false
    }
  }
}
