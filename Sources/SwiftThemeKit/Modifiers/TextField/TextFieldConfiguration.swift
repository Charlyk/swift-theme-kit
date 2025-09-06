import SwiftUI

/// Represents a configuration for a themed text field, allowing overrides for variant, size, shape, font, and error state.
///
/// This struct is typically used in conjunction with environment values to manage consistent styling for custom text field components.
struct TextFieldConfiguration {

  /// The visual style of the text field (e.g., filled, outlined, underlined).
  /// If `nil`, the default variant from the theme will be used.
  var variant: TextFieldVariant? = nil

  /// The size of the text field, which determines padding and font size.
  /// If `nil`, the default size from the theme will be used.
  var size: TextFieldSize? = nil

  /// The shape of the text field, controlling corner radius and clipping behavior.
  /// If `nil`, the default shape from the theme will be used.
  var shape: TextFieldShape? = nil

  /// The font style applied to the text content inside the text field.
  /// If `nil`, the font is determined based on the `size` or theme default.
  var font: ThemeFontToken? = nil

  /// A Boolean flag indicating whether the text field is in an error state.
  /// When `true`, the error color from the theme will be applied to borders and content.
  var isError: Bool = false
}
