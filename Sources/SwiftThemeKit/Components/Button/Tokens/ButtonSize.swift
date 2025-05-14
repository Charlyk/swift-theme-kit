import SwiftUI

public enum ButtonSize: Equatable {
    case small
    case medium
    case large
    case fullWidth
    case custom(EdgeInsets, Font)

    func paddingValues(for theme: Theme) -> EdgeInsets {
        switch self {
        case .small:
            return EdgeInsets(top: theme.spacing.sm,
                              leading: theme.spacing.md,
                              bottom: theme.spacing.sm,
                              trailing: theme.spacing.md)
        case .medium:
            return EdgeInsets(top: theme.spacing.md,
                              leading: theme.spacing.lg,
                              bottom: theme.spacing.md,
                              trailing: theme.spacing.lg)
        case .large:
            return EdgeInsets(top: theme.spacing.lg,
                              leading: theme.spacing.xl,
                              bottom: theme.spacing.lg,
                              trailing: theme.spacing.xl)
        case .fullWidth:
            return EdgeInsets(top: theme.spacing.md,
                              leading: .infinity,
                              bottom: theme.spacing.md,
                              trailing: .infinity)
        case .custom(let edgeInsets, _):
            return edgeInsets
        }
    }

    func font(for theme: Theme) -> Font {
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

    public static func == (lhs: ButtonSize, rhs: ButtonSize) -> Bool {
        switch (lhs, rhs) {
        case (.small, .small), (.medium, .medium), (.large, .large), (.fullWidth, .fullWidth), (.custom, .custom):
            return true
        default:
            return false
        }
    }
}
