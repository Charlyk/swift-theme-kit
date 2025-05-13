import SwiftUI

public extension Theme {
    func copy(
        colors: ThemeColors? = nil,
        typography: ThemeTypography? = nil,
        spacing: ThemeSpacing? = nil,
        radii: ThemeRadii? = nil,
        shadows: ThemeShadows? = nil
    ) -> Theme {
        Theme(
            colors: colors ?? self.colors,
            typography: typography ?? self.typography,
            spacing: spacing ?? self.spacing,
            radii: radii ?? self.radii,
            shadows: shadows ?? self.shadows
        )
    }
}
