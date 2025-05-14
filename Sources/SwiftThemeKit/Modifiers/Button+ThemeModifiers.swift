import SwiftUI

public extension View {
    @ViewBuilder
    func applyThemeButtonStyle(
        variant: ButtonVariant = .filled,
        shape: ButtonShape = .capsule,
        size: ButtonSize = .medium,
        type: ButtonType = .default
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: variant,
                shape: shape,
                size: size,
                type: type
            )
        )
    }

    @ViewBuilder
    func defaultFilledButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .filled,
                shape: shape,
                size: size,
                type: .default
            )
        )
    }

    @ViewBuilder
    func dangerFilledButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .filled,
                shape: shape,
                size: size,
                type: .danger
            )
        )
    }

    @ViewBuilder
    func defaultOutlineButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .outline,
                shape: shape,
                size: size,
                type: .default
            )
        )
    }

    @ViewBuilder
    func dangerOutlineButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .outline,
                shape: shape,
                size: size,
                type: .danger
            )
        )
    }

    @ViewBuilder
    func defaultTonalButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .tonal,
                shape: shape,
                size: size,
                type: .default
            )
        )
    }

    @ViewBuilder
    func dangerTonalButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .tonal,
                shape: shape,
                size: size,
                type: .danger
            )
        )
    }

    @ViewBuilder
    func defaultTextButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .text,
                shape: shape,
                size: size,
                type: .default
            )
        )
    }

    @ViewBuilder
    func dangerTextButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .text,
                shape: shape,
                size: size,
                type: .danger
            )
        )
    }

    @ViewBuilder
    func defaultElevatedButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .elevated,
                shape: shape,
                size: size,
                type: .default
            )
        )
    }

    @ViewBuilder
    func dangerElevatedButtonStyle(
        size: ButtonSize = .medium,
        shape: ButtonShape = .capsule
    ) -> some View {
        self.buttonStyle(
            ThemeButtonStyle(
                variant: .elevated,
                shape: shape,
                size: size,
                type: .danger
            )
        )
    }
}
