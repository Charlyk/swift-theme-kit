import SwiftUI

/// Defines the stroke widths used throughout the design system.
public struct ThemeStroke {

    /// No stroke. Used when no border is needed.
    public let none: CGFloat

    /// Very thin stroke (1pt). Suitable for subtle outlines or hairlines.
    public let xs: CGFloat

    /// Thin stroke (2pt). Used for input fields or minimal borders.
    public let sm: CGFloat

    /// Medium stroke (4pt). Used for prominent component outlines or highlights.
    public let md: CGFloat

    /// Thick stroke (8pt). Used sparingly for high emphasis elements.
    public let lg: CGFloat

    /// The default set of stroke widths for light mode.
    public static let defaultLignt = ThemeStroke(
        none: 0,
        xs: 1,
        sm: 2,
        md: 4,
        lg: 8
    )

    /// The default set of stroke widths for dark mode.
    public static let defaultDark = ThemeStroke(
        none: 0,
        xs: 1,
        sm: 2,
        md: 4,
        lg: 8
    )

    public init(
        none: CGFloat,
        xs: CGFloat,
        sm: CGFloat,
        md: CGFloat,
        lg: CGFloat
    ) {
        self.none = none
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
    }

    public subscript(token: StrokeToken) -> CGFloat {
        switch token {
        case .none: return none
        case .xs: return xs
        case .sm: return sm
        case .md: return md
        case .lg: return lg
        }
    }
}

/// Stroke tokens for standardized access to stroke widths.
public enum StrokeToken {
    case none
    case xs   // 1pt
    case sm   // 2pt
    case md   // 4pt
    case lg   // 8pt
}
