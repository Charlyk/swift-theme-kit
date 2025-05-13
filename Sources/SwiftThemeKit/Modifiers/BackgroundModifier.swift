import SwiftUI

struct BackgroundModifier: ViewModifier {
    @Environment(\.appTheme) private var theme
    let token: ColorToken
    let edgesIgnoringSafeArea: Edge.Set?

    func body(content: Content) -> some View {
        if let edgesIgnoringSafeArea {
            content.background(theme.colors[token].edgesIgnoringSafeArea(edgesIgnoringSafeArea))
        } else {
            content.background(theme.colors[token])
        }
    }
}
