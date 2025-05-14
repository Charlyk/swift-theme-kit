import SwiftUI

struct StrokeModifier: ViewModifier {
    @Environment(\.appTheme) private var theme
    let width: StrokeToken
    var radius: RadiusToken = .md
    var color: ColorToken = .primary

    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: theme.radii[radius])
                .stroke(theme.colors[color], lineWidth: theme.stroke[width])
        )
    }
}
