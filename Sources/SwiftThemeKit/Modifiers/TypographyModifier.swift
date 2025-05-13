import SwiftUI

struct TypographyModifier: ViewModifier {
    @Environment(\.appTheme) private var theme
    let token: TextStyleToken

    func body(content: Content) -> some View {
        content.font(theme.typography[token])
    }
}
