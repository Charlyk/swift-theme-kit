import SwiftUI

public struct ThemeTextFieldStyle: TextFieldStyle {
  let variant: TextFieldVariant
  var size: TextFieldSize = .medium
  let shape: TextFieldShape
  var font: ThemeFontToken? = nil
  let isError: Bool

  @Environment(\.appTheme) private var theme
  @FocusState private var isFocused
  @Environment(\.isEnabled) private var isEnabled
  @State private var fieldSize: CGSize = .zero

  public init(variant: TextFieldVariant, size: TextFieldSize, shape: TextFieldShape, font: ThemeFontToken? = nil, isError: Bool) {
    self.variant = variant
    self.size = size
    self.shape = shape
    self.font = font
    self.isError = isError
  }

  public func _body(configuration: TextField<Self._Label>) -> some View {
    let bgColor = backgroundColor()
    let borderColor: Color = borderColor()
    let foregroundColor: Color = isError ? theme.colors.error : theme.colors.onSurface

    return configuration
      .textFieldStyle(.plain)
      .padding(size.padding(theme: theme))
      .measure($fieldSize)
      .background(backgroundView(color: bgColor))
      .overlay(borderOverlay(color: borderColor))
      .disabled(!isEnabled)
      .focused($isFocused)
      .foregroundStyle(foregroundColor)
      .foregroundColor(isEnabled ? theme.colors.onSurface : theme.colors.onSurfaceVariant.opacity(0.38))
      .font(getFont())
  }

  @ViewBuilder
  private func backgroundView(color: Color) -> some View {
    switch variant {
    case .filled:
      shape.shape(theme: theme)
        .fill(color)
    default:
      Color.clear
    }
  }

  @ViewBuilder
  private func borderOverlay(color: Color) -> some View {
    switch variant {
    case .outlined:
      shape.shape(theme: theme)
        .strokeBorder(color, lineWidth: isFocused ? 2 : 1)
    case .underlined:
      Rectangle()
        .frame(height: isFocused ? 2 : 1)
        .foregroundColor(color)
        .padding(.top, fieldSize.height) // push it to bottom
    default:
      EmptyView()
    }
  }

  private func borderColor() -> Color {
    if isError {
      return theme.colors.error
    } else if !isEnabled {
      return theme.colors.outline.opacity(0.12)
    } else if isFocused {
      return theme.colors.primary
    } else {
      return theme.colors.outline
    }
  }

  private func backgroundColor() -> Color {
    if isError {
      return theme.colors.errorContainer
    } else if !isEnabled {
      return theme.colors.surfaceContainerLow
    } else {
      return theme.colors.surface
    }
  }

  private func getFont() -> Font {
    if let font = font {
      if let weight = font.weight {
        return theme.typography[font.style].weight(weight)
      } else {
        return theme.typography[font.style]
      }
    } else {
      return size.font(theme: theme)
    }
  }
}
