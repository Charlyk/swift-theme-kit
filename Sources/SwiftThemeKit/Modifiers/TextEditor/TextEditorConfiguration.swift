import Foundation

/// Configuration object that holds text editor styling parameters
struct TextEditorConfiguration {
  var variant: TextFieldVariant?
  var size: TextFieldSize?
  var shape: TextFieldShape?
  var font: ThemeFontToken?
  var isError: Bool
  var minHeight: CGFloat?
  var maxHeight: CGFloat?
  
  init(
    variant: TextFieldVariant? = nil,
    size: TextFieldSize? = nil,
    shape: TextFieldShape? = nil,
    font: ThemeFontToken? = nil,
    isError: Bool = false,
    minHeight: CGFloat? = nil,
    maxHeight: CGFloat? = nil
  ) {
    self.variant = variant
    self.size = size
    self.shape = shape
    self.font = font
    self.isError = isError
    self.minHeight = minHeight
    self.maxHeight = maxHeight
  }
}
