import SwiftUI

struct ForegroundModifier: ViewModifier {
    @Environment(\.appTheme) private var theme
    let token: ColorToken

    func body(content: Content) -> some View {
        content.foregroundColor(theme.colors[token])
    }
}
