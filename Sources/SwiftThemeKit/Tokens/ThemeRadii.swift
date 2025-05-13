import Foundation

/// Defines standard corner radius values used throughout the design system.
public struct ThemeRadii {

    /// No corner radius (0pt). Used for completely square edges.
    public let none: CGFloat = .zero

    /// Small corner radius (4pt). Used for subtle rounding on extra small elements or inputs.
    public let xs: CGFloat

    /// Small corner radius (4pt). Used for subtle rounding on small elements or inputs.
    public let sm: CGFloat

    /// Medium corner radius (8pt). Used for buttons, cards, or modals with moderate rounding.
    public let md: CGFloat

    /// Large corner radius (16pt). Ideal for highly rounded containers, cards, or UI highlights.
    public let lg: CGFloat

    /// Large corner radius (28pt). Ideal for highly rounded containers, cards, or UI highlights.
    public let xl: CGFloat

    /// Fully rounded edges (9999pt). Commonly used for pills, tags, badges, or chip components.
    public let pill: CGFloat

    /// A predefined set of corner radius values following the Nucleus design system.
    public static let defaultLight = ThemeRadii(
        xs: 4,
        sm: 8,
        md: 12,
        lg: 16,
        xl: 28,
        pill: 9999
    )

    public static let defaultDark = ThemeRadii(
        xs: 4,
        sm: 8,
        md: 12,
        lg: 16,
        xl: 28,
        pill: 9999
    )

    /// Initializes a custom set of radius tokens.
    public init(xs: CGFloat, sm: CGFloat, md: CGFloat, lg: CGFloat, xl: CGFloat, pill: CGFloat) {
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
        self.pill = pill
    }

    subscript(_ token: RadiusToken) -> CGFloat {
        switch token {
        case .none: return none
        case .xs: return xs
        case .sm: return sm
        case .md: return md
        case .lg: return lg
        case .xl: return xl
        case .pill: return pill
        }
    }
}

public enum RadiusToken {
    case none
    case xs
    case sm
    case md
    case lg
    case xl
    case pill
}
