import SwiftUI

public extension Theme {
  /// Returns a new `Theme` instance by copying the current one
  /// and applying the specified overrides.
  /// - Parameters:
  ///   - colors: The color token configuration.
  ///   - typography: The typography scale.
  ///   - spacing: The spacing scale.
  ///   - radii: The corner radius scale.
  ///   - shadows: The shadow styles for various elevations.
  ///   - stroke: The stroke styles.
  ///   - shapes: The shapes styles used for various components.
  ///   - buttons: The buttons default values used when no modifier applied
  ///   - textFields: The text field default values used when no modifier applied
  ///   - checkboxSize: The size styles for the checkboxes
  ///   - radioButtonSize: The size styles for the radio button
  ///   - platform: The platform on which the app is running.
  func copy(
    colors: ThemeColors? = nil,
    typography: ThemeTypography? = nil,
    spacing: ThemeSpacing? = nil,
    radii: ThemeRadii? = nil,
    shadows: ThemeShadows? = nil,
    stroke: ThemeStroke? = nil,
    shapes: ThemeShapes? = nil,
    buttons: ThemeButtonDefaults? = nil,
    textFields: ThemeTextFieldDefaults? = nil,
    checkboxSize: ThemeCheckboxSize? = nil,
    radioButtonSize: ThemeRadioButtonSize? = nil,
    platform: ThemePlatform? = nil
  ) -> Theme {
    Theme(
      colors: colors ?? self.colors,
      typography: typography ?? self.typography,
      spacing: spacing ?? self.spacing,
      radii: radii ?? self.radii,
      shadows: shadows ?? self.shadows,
      stroke: stroke ?? self.stroke,
      shapes: shapes ?? self.shapes,
      buttons: buttons ?? self.buttons,
      textFields: textFields ?? self.textFields,
      checkboxSize: checkboxSize ?? self.checkboxSize,
      radioButtonSize: radioButtonSize ?? self.radioButtonSize,
      platform: platform ?? self.platform
    )
  }
}
