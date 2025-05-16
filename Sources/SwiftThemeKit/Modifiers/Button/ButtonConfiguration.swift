import Foundation

/// Represents a configuration for a themed button, allowing overrides for styling aspects such as variant, shape, size, and font.
///
/// This structure is typically used in conjunction with environment modifiers to apply consistent theming across buttons in the UI.
struct ButtonConfiguration {

  /// The visual variant of the button (e.g., filled, outline, tonal, etc.).
  /// If `nil`, the default variant from the theme will be used.
  var variant: ButtonVariant? = nil

  /// The shape of the button (e.g., capsule, rounded, square).
  /// If `nil`, the default shape from the theme will be used.
  var shape: ButtonShape? = nil

  /// The size of the button (e.g., small, medium, large, fullWidth).
  /// If `nil`, the default size from the theme will be used.
  var size: ButtonSize? = nil

  /// The font style used for the button’s label, defined by a `ThemeFontToken`.
  /// If `nil`, the font will be chosen based on the button size or theme default.
  var font: ThemeFontToken? = nil
}
