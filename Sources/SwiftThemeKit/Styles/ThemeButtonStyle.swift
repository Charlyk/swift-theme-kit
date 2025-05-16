import SwiftUI

public struct ThemeButtonStyle: ButtonStyle {
  let variant: ButtonVariant
  let size: ButtonSize
  let shape: ButtonShape
  let font: ThemeFontToken?
  
  @Environment(\.appTheme) private var theme
  @Environment(\.isEnabled) private var isEnabled
  
  public init(variant: ButtonVariant = .filled,
              size: ButtonSize = .medium,
              shape: ButtonShape = .rounded,
              font: ThemeFontToken? = nil) {
    self.variant = variant
    self.size = size
    self.shape = shape
    self.font = font
  }
  
  public func makeBody(configuration: Configuration) -> some View {
    let isPressed = configuration.isPressed
    let isDestructive = configuration.role == .destructive
    
    let bgColor: Color
    let borderColor: Color
    let fgColor: Color
    var shadow: ThemeShadow? = nil
    let padding: EdgeInsets
    
    switch variant {
    case .filled:
      let typedBgColor = isDestructive ? theme.colors.error : theme.colors.primary
      bgColor = isPressed ? typedBgColor.lighten(by: 0.1) : typedBgColor
      borderColor = .clear
      fgColor = isDestructive ? theme.colors.onError : theme.colors.onPrimary
      padding = size.paddingValues(for: theme)
    case .tonal:
      let typedBgColor = isDestructive ? theme.colors.errorContainer : theme.colors.secondaryContainer
      bgColor = isPressed ? typedBgColor.lighten(by: 0.1) : typedBgColor
      borderColor = .clear
      fgColor = isDestructive ? theme.colors.onErrorContainer : theme.colors.onSecondaryContainer
      padding = size.paddingValues(for: theme)
    case .outline:
      let pressedBgColo = isDestructive ? theme.colors.error.opacity(0.05) : theme.colors.primary.opacity(0.05)
      bgColor = isPressed ? pressedBgColo : .clear
      borderColor = isDestructive ? theme.colors.error : theme.colors.outlineVariant
      fgColor = isDestructive ? theme.colors.error : theme.colors.onSurfaceVariant
      padding = size.paddingValues(for: theme)
    case .elevated:
      bgColor = isPressed ? theme.colors.surfaceContainerLow.darken(by: 0.1) : theme.colors.surfaceContainerLow
      borderColor = .clear
      fgColor = isDestructive ? theme.colors.error : theme.colors.primary
      padding = size.paddingValues(for: theme)
      shadow = theme.shadows.md
    case .text:
      bgColor = .clear
      borderColor = .clear
      fgColor = isDestructive ? theme.colors.error : theme.colors.primary
      padding = size.paddingValues(for: theme)
    }
    
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
      .opacity(configuration.isPressed ? 0.9 : 1.0)
  }
  
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
