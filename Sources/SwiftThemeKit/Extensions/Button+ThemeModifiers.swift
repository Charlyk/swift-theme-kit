import SwiftUI

public extension View {
  @ViewBuilder
  func applyThemeButtonStyle() -> some View {
    self
      .modifier(ThemedButtonModifier())
      .modifier(ApplyFinalButtonStyleModifier())
  }

  @ViewBuilder
  func buttonVariant(_ variant: ButtonVariant) -> some View {
    self.modifier(ButtonVariantModifier(token: variant))
  }

  @ViewBuilder
  func buttonSize(_ size: ButtonSize) -> some View {
    self.modifier(ButtonSizeModifier(token: size))
  }

  @ViewBuilder
  func buttonShape(_ shape: ButtonShape) -> some View {
    self.modifier(ButtonShapeModifier(token: shape))
  }

  @ViewBuilder
  func plainTextButton(_ style: TextStyleToken = .buttonText, weight: Font.Weight? = nil) -> some View {
    self.buttonStyle(PlainTextButtonStyle(token: ThemeFontToken(style, weight: weight)))
  }

  @ViewBuilder
  func labelStyle(_ token: TextStyleToken, weight: Font.Weight? = nil) -> some View {
    let fontToken = ThemeFontToken(token, weight: weight)
    self.modifier(ButtonFontModifier(token: fontToken))
  }
}
