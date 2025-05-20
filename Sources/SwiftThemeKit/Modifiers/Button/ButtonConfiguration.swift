import SwiftUI

/// A configuration container that defines style overrides for a themed button.
///
/// `ButtonConfiguration` is used internally and via environment injection to customize
/// how a button is rendered. You can override variant, shape, size, font, and colors independently.
/// If any value is `nil`, the theme's default value will be used automatically.
///
/// This struct supports granular control and is typically set using modifiers like:
/// `buttonVariant(_:)`, `buttonShape(_:)`, `buttonSize(_:)`, or `buttonLabelStyle(_:)`.
struct ButtonConfiguration {

  /// The visual style variant of the button.
  ///
  /// Examples include:
  /// - `.filled`: Solid background
  /// - `.outline`: Transparent background with a stroke
  /// - `.text`: Minimalist button with no background or border
  ///
  /// If `nil`, the variant from `Theme.buttons` will be applied.
  var variant: ButtonVariant? = nil

  /// The shape of the button (e.g., `.capsule`, `.rounded`, `.rectangle`).
  ///
  /// This defines how the button is clipped and styled.
  /// If `nil`, the theme-defined shape will be used.
  var shape: ButtonShape? = nil

  /// The size of the button, affecting height, padding, and potentially font.
  ///
  /// Valid options include `.small`, `.medium`, `.large`, and `.fullWidth`.
  /// If `nil`, the theme default size will be applied.
  var size: ButtonSize? = nil

  /// The font style for the button's label, defined by a `ThemeFontToken`.
  ///
  /// If unset, the font will be automatically chosen based on the current size
  /// or the default from the theme's button configuration.
  var font: ThemeFontToken? = nil

  /// An optional override for the background color of the button.
  ///
  /// If set, this color takes precedence over variant-based colors.
  /// If `nil`, the variant or theme determines the background color.
  var backgroundColor: Color? = nil

  /// An optional override for the foreground (text/icon) color of the button.
  ///
  /// If set, this color overrides the one provided by the variant or theme.
  var foregroundColor: Color? = nil
}
