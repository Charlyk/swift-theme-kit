import SwiftUI

public extension ThemeShadow {
    /// Returns a new `ThemeShadow` instance by copying the current one
    /// and applying the specified overrides.
    ///
    /// - Parameters:
    ///   - color: Optional override for the shadow color.
    ///   - radius: Optional override for the blur radius.
    ///   - x: Optional override for the horizontal offset.
    ///   - y: Optional override for the vertical offset.
    /// - Returns: A new `ThemeShadow` instance with the applied overrides.
    func copy(
        color: Color? = nil,
        radius: CGFloat? = nil,
        x: CGFloat? = nil,
        y: CGFloat? = nil
    ) -> ThemeShadow {
        ThemeShadow(
            color: color ?? self.color,
            radius: radius ?? self.radius,
            x: x ?? self.x,
            y: y ?? self.y
        )
    }
}
