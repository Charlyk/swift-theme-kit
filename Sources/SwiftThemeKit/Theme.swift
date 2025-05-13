/// A complete representation of a visual theme including color, typography, spacing, radius, and shadow tokens.
/// The `Theme` struct is the root context for all styling logic in a themed SwiftUI application.
public struct Theme {

    /// The set of color tokens used throughout the UI.
    /// Includes semantic roles like `primary`, `onSurface`, `background`, etc.
    public let colors: ThemeColors

    /// The full typography scale used for all text elements, including headings, body text, and labels.
    public let typography: ThemeTypography

    /// The standard spacing scale for padding, margins, and layout spacing.
    public let spacing: ThemeSpacing

    /// The radius scale used for rounded corners and clip shapes.
    public let radii: ThemeRadii

    /// The set of shadow styles representing elevation or focus states.
    public let shadows: ThemeShadows

    /// Initializes a new theme instance with custom tokens.
    ///
    /// - Parameters:
    ///   - colors: The color token configuration.
    ///   - typography: The typography scale.
    ///   - spacing: The spacing scale.
    ///   - radii: The corner radius scale.
    ///   - shadows: The shadow styles for various elevations.
    public init(
        colors: ThemeColors,
        typography: ThemeTypography,
        spacing: ThemeSpacing,
        radii: ThemeRadii,
        shadows: ThemeShadows
    ) {
        self.colors = colors
        self.typography = typography
        self.spacing = spacing
        self.radii = radii
        self.shadows = shadows
    }

    /// The default theme configuration optimized for light mode.
    /// Uses `defaultLight` for colors and shadows, and shared defaults for other scales.
    public static var defaultLight: Theme = Theme(
        colors: .defaultLight,
        typography: .defaultLight,
        spacing: .defaultLight,
        radii: .defaultLight,
        shadows: .defaultLight
    )

    /// The default theme configuration optimized for dark mode.
    /// Uses `defaultDark` for colors and shadows, and shared defaults for other scales.
    public static var defaultDark: Theme = Theme(
        colors: .defaultDark,
        typography: .defaultDark,
        spacing: .defaultDark,
        radii: .defaultDark,
        shadows: .defaultDark
    )
}
