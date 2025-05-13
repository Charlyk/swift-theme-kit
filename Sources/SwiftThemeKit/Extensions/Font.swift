import SwiftUI

extension Font {
    /// Returns a custom Plus Jakarta Sans font with the given size and weight.
    static func jakarta(_ size: CGFloat, weight: Font.Weight) -> Font {
        let name: String

        switch weight {
        case .regular:
            name = "PlusJakartaSans-Regular"
        case .medium:
            name = "PlusJakartaSans-Medium"
        case .semibold:
            name = "PlusJakartaSans-SemiBold"
        case .bold:
            name = "PlusJakartaSans-Bold"
        default:
            name = "PlusJakartaSans-Regular"
        }

        return .custom(name, size: size)
    }
}
