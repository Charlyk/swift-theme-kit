import SwiftUI

/// A comprehensive button style that applies consistent theming across different button variants,
/// shapes, sizes, and font styles.
///
/// `ThemeButtonStyle` supports:
/// - Filled, Tonal, Outline, Elevated, and Text button variants
/// - Destructive role styling (uses error colors)
/// - Dynamic background and border colors for enabled, disabled, and pressed states
/// - Adaptive padding, shape, font, and shadow based on theme tokens
///
/// ### Example:
/// ```swift
/// Button("Save") { ... }
///   .buttonStyle(ThemeButtonStyle(variant: .filled, size: .large))
/// ```
///
/// Use this style in conjunction with `applyThemeButtonStyle()`, `buttonVariant()`, etc.
/// for more declarative usage in your design system.
///
/// - Parameters:
///   - variant: The visual variant of the button (e.g., `.filled`, `.outline`, etc.).
///   - size: The padding and font size configuration.
///   - shape: The corner style for the button.
///   - font: Optional override for the font style and weight.
public struct ThemeButtonStyle: ButtonStyle {
  let variant: ButtonVariant
  let size: ButtonSize
  let shape: ButtonShape
  let font: ThemeFontToken?
  let backgroundColor: Color?
  let foregroundColor: Color?

  @Environment(\.appTheme) private var theme
  @Environment(\.isEnabled) private var isEnabled

  public init(
    variant: ButtonVariant = .filled,
    size: ButtonSize = .medium,
    shape: ButtonShape = .rounded,
    font: ThemeFontToken? = nil,
    backgroundColor: Color? = nil,
    foregroundColor: Color? = nil
  ) {
    self.variant = variant
    self.size = size
    self.shape = shape
    self.font = font
    self.backgroundColor = backgroundColor
    self.foregroundColor = foregroundColor
  }

  public func makeBody(configuration: Configuration) -> some View {
    let isPressed = configuration.isPressed
    let isDestructive = configuration.role == .destructive

    let bgColor: Color
    let borderColor: Color
    let fgColor: Color
    var shadow: ThemeShadow? = nil
    let padding: EdgeInsets

    // Configure button colors and shadows based on variant
    switch variant {
    case .filled:
      let typedBgColor = backgroundColor ?? (isDestructive ? theme.colors.error : theme.colors.primary)
      bgColor = isPressed ? typedBgColor.lighten(by: 0.1) : typedBgColor
      borderColor = .clear
      fgColor = foregroundColor ?? (isDestructive ? theme.colors.onError : theme.colors.onPrimary)
      padding = size.paddingValues(for: theme)

    case .tonal:
      let typedBgColor = backgroundColor ?? (isDestructive ? theme.colors.errorContainer : theme.colors.secondaryContainer)
      bgColor = isPressed ? typedBgColor.lighten(by: 0.1) : typedBgColor
      borderColor = .clear
      fgColor = foregroundColor ?? (isDestructive ? theme.colors.onErrorContainer : theme.colors.onSecondaryContainer)
      padding = size.paddingValues(for: theme)

    case .outline:
      let pressedBgColor = isDestructive
        ? theme.colors.error.opacity(0.05)
        : theme.colors.primary.opacity(0.05)
      bgColor = isPressed ? pressedBgColor : .clear
      borderColor = backgroundColor ?? (isDestructive ? theme.colors.error : theme.colors.outlineVariant)
      fgColor = foregroundColor ?? (isDestructive ? theme.colors.error : theme.colors.onSurfaceVariant)
      padding = size.paddingValues(for: theme)

    case .elevated:
      bgColor = backgroundColor ?? (isPressed
        ? theme.colors.surfaceContainerLow.darken(by: 0.1)
        : theme.colors.surfaceContainerLow)
      borderColor = .clear
      fgColor = isDestructive ? theme.colors.error : theme.colors.primary
      padding = size.paddingValues(for: theme)
      shadow = theme.shadows.md

    case .text:
      bgColor = .clear
      borderColor = .clear
      fgColor = foregroundColor ?? (isDestructive ? theme.colors.error : theme.colors.primary)
      padding = size.paddingValues(for: theme)
    }

    // Adjust colors for disabled state
    let effectiveBgColor = isEnabled ? bgColor : theme.colors.onSurface.opacity(0.12)
    let effectiveFgColor = isEnabled ? fgColor : theme.colors.onSurface.opacity(0.32)

    return configuration.label
      .foregroundColor(effectiveFgColor)
      .if(size != .fullWidth) { $0.padding(padding) }
      .if(size == .fullWidth) {
        $0.frame(maxWidth: .infinity)
          .padding(.top, padding.top)
          .padding(.bottom, padding.bottom)
      }
      .font(getFont())
      .background(effectiveBgColor)
      .if(variant == .outline) {
        $0.background(
          RoundedRectangle(cornerRadius: shape.radius(for: theme))
            .stroke(borderColor, lineWidth: theme.stroke.sm)
        )
      }
      .clipShape(shape.shape(theme: theme))
      .contentShape(shape.shape(theme: theme))
      .if(shadow != nil) {
        $0.shadow(color: shadow!.color, radius: shadow!.radius, x: shadow!.x, y: shadow!.y)
      }
      .opacity(isPressed ? 0.9 : 1.0)
  }

  /// Returns the effective font based on the theme or overrides.
  private func getFont() -> Font {
    if let font = font {
      if let weight = font.weight {
        return theme.typography[font.style].weight(weight)
      } else {
        return theme.typography[font.style]
      }
    } else {
      return size.font(for: theme)
    }
  }
}
