import SwiftUI

/// A custom wrapper for TextEditor that applies theming based on a `Theme` context.
///
/// This style supports Material-style variants like `filled`, `outlined`, and `underlined`,
/// and adjusts typography, padding, shape, color, and focus indicators accordingly.
public struct ThemedTextEditor: View {
  @Binding var text: String
  let placeholder: String

  // Optional overrides - if nil, will use environment configuration
  private let variantOverride: TextFieldVariant?
  private let sizeOverride: TextFieldSize?
  private let shapeOverride: TextFieldShape?
  private let fontOverride: ThemeFontToken?
  private let isErrorOverride: Bool?
  private let minHeightOverride: CGFloat?
  private let maxHeightOverride: CGFloat?

  @Environment(\.appTheme) private var theme
  @Environment(\.textEditorConfiguration) private var config
  @FocusState private var isFocused
  @Environment(\.isEnabled) private var isEnabled
  @State private var fieldSize: CGSize = .zero

  /// Initializes a new themed text editor with customization options.
  public init(
    text: Binding<String>,
    placeholder: String,
    variant: TextFieldVariant? = nil,
    size: TextFieldSize? = nil,
    shape: TextFieldShape? = nil,
    font: ThemeFontToken? = nil,
    isError: Bool? = nil,
    minHeight: CGFloat? = nil,
    maxHeight: CGFloat? = nil
  ) {
    self._text = text
    self.placeholder = placeholder
    self.variantOverride = variant
    self.sizeOverride = size
    self.shapeOverride = shape
    self.fontOverride = font
    self.isErrorOverride = isError
    self.minHeightOverride = minHeight
    self.maxHeightOverride = maxHeight
  }

  /// The main body of the themed text editor.
  public var body: some View {
    let variant = variantOverride ?? config.variant ?? theme.textFields.variant
    let size = sizeOverride ?? config.size ?? theme.textFields.size
    let shape = shapeOverride ?? config.shape ?? theme.textFields.shape
    let font = fontOverride ?? config.font
    let isError = isErrorOverride ?? config.isError
    let minHeight = minHeightOverride ?? config.minHeight ?? 60
    let maxHeight = maxHeightOverride ?? config.maxHeight ?? 120

    let bgColor = backgroundColor(isError: isError)
    let borderColor: Color = borderColor(isError: isError)

    ZStack(alignment: .topLeading) {
      // Placeholder text
      if text.isEmpty {
        Text(placeholder)
          .font(getFont(size: size, font: font))
          .foregroundColor(theme.colors.onSurfaceVariant.opacity(0.6))
          .padding(size.padding(theme: theme))
          .allowsHitTesting(false)
      }

      if #available(iOS 16.0, *), #available(macOS 13.0, *) {
        TextEditor(text: $text)
          .font(getFont(size: size, font: font))
          .scrollContentBackground(.hidden) // iOS 16+ feature, but safe to use
          .background(Color.clear)
          .padding(size.padding(theme: theme))
          .focused($isFocused)
          .foregroundColor(
            isEnabled
            ? theme.colors.onSurface
            : theme.colors.onSurfaceVariant.opacity(0.38)
          )
      } else {
        TextEditor(text: $text)
          .font(getFont(size: size, font: font))
          .background(Color.clear)
          .padding(size.padding(theme: theme))
          .focused($isFocused)
          .foregroundColor(
            isEnabled
            ? theme.colors.onSurface
            : theme.colors.onSurfaceVariant.opacity(0.38)
          )
      }
    }
    .frame(minHeight: minHeight, maxHeight: maxHeight)
    .measure($fieldSize)
    .background(backgroundView(variant: variant, shape: shape, color: bgColor))
    .overlay(borderOverlay(variant: variant, shape: shape, color: borderColor))
    .disabled(!isEnabled)
  }

  /// Builds the background shape for `.filled` variant.
  @ViewBuilder
  private func backgroundView(variant: TextFieldVariant, shape: TextFieldShape, color: Color) -> some View {
    switch variant {
    case .filled:
      shape.shape(theme: theme).fill(color)
    default:
      Color.clear
    }
  }

  /// Builds the border or underline for `outlined` and `underlined` variants.
  @ViewBuilder
  private func borderOverlay(variant: TextFieldVariant, shape: TextFieldShape, color: Color) -> some View {
    switch variant {
    case .outlined:
      shape.shape(theme: theme)
        .strokeBorder(color, lineWidth: isFocused ? theme.stroke.sm : theme.stroke.xs)
    case .underlined:
      Rectangle()
        .frame(height: isFocused ? theme.stroke.sm : theme.stroke.xs)
        .foregroundColor(color)
        .padding(.top, fieldSize.height)
    default:
      EmptyView()
    }
  }

  /// Computes the appropriate border color based on focus, error, and disabled states.
  private func borderColor(isError: Bool) -> Color {
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

  private func backgroundColor(isError: Bool) -> Color {
    if isError {
      return theme.colors.errorContainer
    } else if !isEnabled {
      return theme.colors.surfaceContainerLow
    } else {
      return theme.colors.surface
    }
  }

  /// Resolves the font to use based on the theme and optional override.
  private func getFont(size: TextFieldSize, font: ThemeFontToken?) -> Font {
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
