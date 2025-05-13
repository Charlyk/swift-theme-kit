import SwiftUI

struct ClipRadiusModifier: ViewModifier {
    @Environment(\.appTheme) private var theme
    let token: RadiusToken
    var style: RoundedCornerStyle = .circular

    func body(content: Content) -> some View {
        content.clipShape(
            RoundedRectangle(cornerRadius: theme.radii[token], style: style)
        )
    }
}
