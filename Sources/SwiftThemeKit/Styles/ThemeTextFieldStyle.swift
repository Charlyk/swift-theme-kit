import SwiftUI

/// A custom text field style that applies theming based on a `Theme` context.
///
/// This style supports Material-style variants like `filled`, `outlined`, and `underlined`,
/// and adjusts typography, padding, shape, color, and focus indicators accordingly.
///
/// - Parameters:
///   - variant: The visual style of the field (e.g. `.filled`, `.outlined`, `.underlined`).
///   - size: The field size which controls padding and font.
///   - shape: The shape used to clip and stroke the background (e.g. rounded, capsule).
///   - font: Optional font override using a `ThemeFontToken`. If `nil`, falls back to size-defined font.
///   - isError: Whether to display the error state (e.g. red border and text).
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

  /// Initializes a new themed text field style with customization options.
  public init(
    variant: TextFieldVariant,
    size: TextFieldSize,
    shape: TextFieldShape,
    font: ThemeFontToken? = nil,
    isError: Bool
  ) {
    self.variant = variant
    self.size = size
    self.shape = shape
    self.font = font
    self.isError = isError
  }

  /// The core method that builds the styled text field.
  public func _body(configuration: TextField<Self._Label>) -> some View {
    let bgColor = backgroundColor()
    let borderColor: Color = borderColor()
    let foregroundColor: Color = isError ? theme.colors.error : theme.colors.onSurface

    return configuration
      .textFieldStyle(.plain) // Avoid default styling
      .padding(size.padding(theme: theme)) // Apply padding based on size
      .measure($fieldSize) // Store size to place underline dynamically
      .background(backgroundView(color: bgColor)) // Optional filled background
      .overlay(borderOverlay(color: borderColor)) // Draw border depending on variant
      .disabled(!isEnabled)
      .focused($isFocused)
      .foregroundStyle(foregroundColor)
      .foregroundColor(
        isEnabled
          ? theme.colors.onSurface
          : theme.colors.onSurfaceVariant.opacity(0.38)
      )
      .font(getFont())
  }

  /// Builds the background shape for `.filled` variant.
  @ViewBuilder
  private func backgroundView(color: Color) -> some View {
    switch variant {
    case .filled:
      shape.shape(theme: theme).fill(color)
    default:
      Color.clear
    }
  }

  /// Builds the border or underline for `outlined` and `underlined` variants.
  @ViewBuilder
  private func borderOverlay(color: Color) -> some View {
    switch variant {
    case .outlined:
      shape.shape(theme: theme)
        .strokeBorder(color, lineWidth: isFocused ? theme.stroke.sm : theme.stroke.xs)
    case .underlined:
      Rectangle()
        .frame(height: isFocused ? theme.stroke.sm : theme.stroke.xs)
        .foregroundColor(color)
        .padding(.top, fieldSize.height) // Push underline to bottom
    default:
      EmptyView()
    }
  }

  /// Computes the appropriate border color based on focus, error, and disabled states.
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

  /// Resolves the font to use based on the theme and optional override.
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
