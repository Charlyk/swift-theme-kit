import Foundation

/// A complete representation of a visual theme including color, typography, spacing, radius, and shadow tokens.
/// The `Theme` struct is the root context for all styling logic in a themed SwiftUI application.
public struct Theme: Equatable {
  
  /// The set of color tokens used throughout the UI.
  /// Includes semantic roles like `primary`, `onSurface`, `background`, etc.
  public let colors: ThemeColors
  
  /// The full typography scale used for all text elements, including headings, body text, and labels.
  public let typography: ThemeTypography
  
  /// The standard spacing scale for padding, margins, and layout spacing.
  public let spacing: ThemeSpacing
  
  /// The radius scale used for rounded corners and clip shapes.
  public let radii: ThemeRadii
  
  /// The set of shadow styles representing elevation or focus states.
  public let shadows: ThemeShadows
  
  /// The set of stroke styles
  public let stroke: ThemeStroke
  
  /// The set of shapes styles used in clipShape modifiers
  public let shapes: ThemeShapes
  
  /// The set of buttons default configurations
  public let buttons: ThemeButtonDefaults
  
  /// The set of text field default configurations
  public let textFields: ThemeTextFieldDefaults

  /// The set of checkbox size styles
  public let checkboxSize: ThemeCheckboxSize

  /// The set of radio button size styles
  public let radioButtonSize: ThemeRadioButtonSize

  /// The platform on which the app is running. Default is `.current`.
  public let platform: ThemePlatform

  /// Initializes a new theme instance with custom tokens.
  ///
  /// - Parameters:
  ///   - colors: The color token configuration.
  ///   - typography: The typography scale.
  ///   - spacing: The spacing scale.
  ///   - radii: The corner radius scale.
  ///   - shadows: The shadow styles for various elevations.
  ///   - stroke: The stroke styles.
  ///   - shapes: The shapes styles used for various components.
  ///   - buttons: The buttons default values used when no modifier applied.
  ///   - textFields: The text fields default configuration used when no modifier applied.
  ///   - checkboxSize: The set of checkbox size styles.
  ///   - radioButtonSize: The set of radio button size styles.
  ///   - platform: The platform on which the app is running. Default is `.current`.
  public init(
    colors: ThemeColors,
    typography: ThemeTypography,
    spacing: ThemeSpacing,
    radii: ThemeRadii,
    shadows: ThemeShadows,
    stroke: ThemeStroke,
    shapes: ThemeShapes,
    buttons: ThemeButtonDefaults,
    textFields: ThemeTextFieldDefaults,
    checkboxSize: ThemeCheckboxSize,
    radioButtonSize: ThemeRadioButtonSize,
    platform: ThemePlatform = .current
  ) {
    self.colors = colors
    self.typography = typography
    self.spacing = spacing
    self.radii = radii
    self.shadows = shadows
    self.stroke = stroke
    self.shapes = shapes
    self.buttons = buttons
    self.textFields = textFields
    self.checkboxSize = checkboxSize
    self.radioButtonSize = radioButtonSize
    self.platform = platform
  }
  
  /// The default theme configuration optimized for light mode.
  /// Uses `defaultLight` for colors and shadows, and shared defaults for other scales.
  public static var defaultLight: Theme = Theme(
    colors: .defaultLight,
    typography: .defaultLight,
    spacing: .defaultLight,
    radii: .defaultLight,
    shadows: .defaultLight,
    stroke: .defaultLight,
    shapes: .defaultLight,
    buttons: .defaultLight,
    textFields: .defaultLight,
    checkboxSize: .defaultLight,
    radioButtonSize: .defaultLight,
    platform: .current
  )
  
  /// The default theme configuration optimized for dark mode.
  /// Uses `defaultDark` for colors and shadows, and shared defaults for other scales.
  public static var defaultDark: Theme = Theme(
    colors: .defaultDark,
    typography: .defaultDark,
    spacing: .defaultDark,
    radii: .defaultDark,
    shadows: .defaultDark,
    stroke: .defaultDark,
    shapes: .defaultDark,
    buttons: .defaultDark,
    textFields: .defaultDark,
    checkboxSize: .defaultDark,
    radioButtonSize: .defaultDark,
    platform: .current
  )
}
