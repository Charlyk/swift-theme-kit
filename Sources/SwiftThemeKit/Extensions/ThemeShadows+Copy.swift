import SwiftUI

public extension ThemeShadows {
    /// Returns a new `ThemeShadows` instance by copying the current one
    /// and applying the specified overrides.
    ///
    /// Only the provided parameters will be replaced; all others will retain their existing values.
    ///
    /// - Parameters:
    ///   - sm: Optional override for the small shadow.
    ///   - md: Optional override for the medium shadow.
    ///   - lg: Optional override for the large shadow.
    ///   - focus: Optional override for the focus shadow.
    ///   - none: Optional override for the no-shadow style.
    /// - Returns: A new `ThemeShadows` instance with applied overrides.
    func copy(
        sm: ThemeShadow? = nil,
        md: ThemeShadow? = nil,
        lg: ThemeShadow? = nil,
        focus: ThemeShadow? = nil,
        none: ThemeShadow? = nil
    ) -> ThemeShadows {
        ThemeShadows(
            sm: sm ?? self.sm,
            md: md ?? self.md,
            lg: lg ?? self.lg,
            focus: focus ?? self.focus,
            none: none ?? self.none
        )
    }
}
