import SwiftUI

public struct ThemeShapes {
    /// A shape style with 4 same-sized corners smaller than ThemeShapes.sm.
    public let xs: RoundedRectangle

    /// A shape style with 4 same-sized corners bigger than ThemeShapes.xs.
    public let sm: RoundedRectangle

    /// A shape style with 4 same-sized corners bigger than ThemeShapes.sm.
    public let md: RoundedRectangle

    /// A shape style with 4 same-sized corners bigger than ThemeShapes.md.
    public let lg: RoundedRectangle

    /// A shape style with 4 same-sized corners bigger than ThemeShapes.lg.
    public let xl: RoundedRectangle

    public static let defaultLight: ThemeShapes = ThemeShapes(
        xs: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.xs),
        sm: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.sm),
        md: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.md),
        lg: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.lg),
        xl: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.xl)
    )

    public static let defaultDark: ThemeShapes = ThemeShapes(
        xs: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.xs),
        sm: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.sm),
        md: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.md),
        lg: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.lg),
        xl: RoundedRectangle(cornerRadius: ThemeRadii.defaultLight.xl)
    )

    public init(xs: RoundedRectangle, sm: RoundedRectangle, md: RoundedRectangle, lg: RoundedRectangle, xl: RoundedRectangle) {
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
    }

    subscript(_ token: ShapeTokens) -> RoundedRectangle {
        switch(token) {
        case .xs: return xs
        case .sm: return sm
        case .md: return md
        case .lg: return lg
        case .xl: return xl
        }
    }
}

public enum ShapeTokens {
    case xs
    case sm
    case md
    case lg
    case xl
}
