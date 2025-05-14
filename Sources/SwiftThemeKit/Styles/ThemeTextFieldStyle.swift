import SwiftUI

public struct ThemeTextFieldStyle: TextFieldStyle {
    @Environment(\.isFocused) private var isFocused: Bool
    @Environment(\.appTheme) private var theme

    public init() {}

    public func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(.vertical, theme.spacing.sm)
            .padding(.horizontal, theme.spacing.md)
            .backgroundColor(.surfaceContainer)
            .clipShape(.md)
            .overlay(
                RoundedRectangle(cornerRadius: theme.radii.md)
                    .strokeBorder(
                        isFocused ? theme.colors.primary : theme.colors.outline,
                        lineWidth: isFocused ? 2 : 1
                    )
            )
            .font(theme.typography.bodyMedium)
            .foregroundColor(theme.colors.onSurface)
    }
}
