import SwiftUI

public enum TextFieldSize {
  case small
  case medium
  case large

  public func padding(theme: Theme) -> EdgeInsets {
    switch self {
    case .small:
      return EdgeInsets(top: theme.spacing.sm, leading: theme.spacing.sm, bottom: theme.spacing.sm, trailing: theme.spacing.sm)
    case .medium:
      return EdgeInsets(top: theme.spacing.md, leading: theme.spacing.md, bottom: theme.spacing.md, trailing: theme.spacing.md)
    case .large:
      return EdgeInsets(top: theme.spacing.lg, leading: theme.spacing.lg, bottom: theme.spacing.lg, trailing: theme.spacing.lg)
    }
  }

  public func font(theme: Theme) -> Font {
    switch self {
    case .small: return theme.typography.bodySmall
    case .medium: return theme.typography.bodyMedium
    case .large: return theme.typography.bodyLarge
    }
  }
}
