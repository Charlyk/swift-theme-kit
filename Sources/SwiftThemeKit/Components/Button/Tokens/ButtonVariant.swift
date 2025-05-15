import SwiftUI

public enum ButtonVariant {
  case filled
  case tonal
  case outline
  case elevated
  case text

  func borderColor(for theme: Theme, role: ButtonRole? = nil) -> Color {
    let isDestructive = role == .destructive
    switch self {
    case .filled, .tonal, .elevated, .text:
      return .clear
    case .outline:
      return isDestructive ? theme.colors.error : theme.colors.primary
    }
  }
}
