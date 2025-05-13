import SwiftUI

struct ShadowModifier: ViewModifier {
    @Environment(\.appTheme) private var theme
    let token: ShadowToken

    func body(content: Content) -> some View {
        let shadow = theme.shadows[token]

        content.shadow(
            color: shadow.color,
            radius: shadow.radius,
            x: shadow.x,
            y: shadow.y
        )
    }
}
