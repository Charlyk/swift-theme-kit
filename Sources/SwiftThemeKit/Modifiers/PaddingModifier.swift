import SwiftUI

struct PaddingModifier: ViewModifier {
    @Environment(\.appTheme) private var theme
    let edges: Edge.Set
    let token: SpacingToken

    func body(content: Content) -> some View {
        content.padding(edges, theme.spacing[token])
    }
}
