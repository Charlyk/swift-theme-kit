import SwiftUI

/// Represents the available size tokens for a radio button component.
///
/// Use this enum to configure the size of a radio button when applying modifiers or creating custom styles.
public enum RadioButtonSizeToken: String, CaseIterable, Equatable {
  /// A small radio button. Optimized for compact UIs or dense layouts.
  case small

  /// A medium radio button. Suitable for standard form controls and settings.
  case medium

  /// A large radio button. Ideal for touch interfaces, TV platforms, or accessibility.
  case large
}

/// Defines the layout configuration for a radio button at different size levels.
///
/// `ThemeRadioButtonSize` stores the configuration for small, medium, and large radio buttons,
/// including their visual size, stroke width, font style, and label spacing. The actual
/// values are platform-specific and retrieved from `ThemePlatform`.
///
/// This struct is injected through the current theme, allowing consistent sizing across the app.
public struct ThemeRadioButtonSize: Equatable {

  /// Radio button configuration for `.small` size.
  ///
  /// - Size: Compact box.
  /// - Font: Smaller label typography.
  /// - Label spacing: Tight spacing between box and text.
  let small: RadioButtonConfiguration

  /// Radio button configuration for `.medium` size.
  ///
  /// - Size: Standard radio button.
  /// - Font: Medium body typography.
  /// - Label spacing: Balanced layout for most use cases.
  let medium: RadioButtonConfiguration

  /// Radio button configuration for `.large` size.
  ///
  /// - Size: Enlarged for accessibility or large screens.
  /// - Font: Larger, prominent typography.
  /// - Label spacing: Generous spacing for clarity.
  let large: RadioButtonConfiguration

  /// The default radio button sizing configuration for light themes.
  ///
  /// Sizing values are computed using `ThemePlatform` based on the current platform (iOS, macOS, etc.).
  static let defaultLight = ThemeRadioButtonSize(
    small: .init(
      size: ThemePlatform.current.radioButtonSize(for: .small),
      labelSpacing: ThemePlatform.current.radioButtonLabelSpacing(for: .small),
      font: ThemePlatform.current.radioButtonFontStyle(for: .small),
      stroke: ThemePlatform.current.radioButtonStrokeWidth(for: .small)
    ),
    medium: .init(
      size: ThemePlatform.current.radioButtonSize(for: .medium),
      labelSpacing: ThemePlatform.current.radioButtonLabelSpacing(for: .medium),
      font: ThemePlatform.current.radioButtonFontStyle(for: .medium),
      stroke: ThemePlatform.current.radioButtonStrokeWidth(for: .medium)
    ),
    large: .init(
      size: ThemePlatform.current.radioButtonSize(for: .large),
      labelSpacing: ThemePlatform.current.radioButtonLabelSpacing(for: .large),
      font: ThemePlatform.current.radioButtonFontStyle(for: .large),
      stroke: ThemePlatform.current.radioButtonStrokeWidth(for: .large)
    )
  )

  /// The default radio button sizing configuration for dark themes.
  ///
  /// The label spacing and stroke may differ slightly to improve contrast and accessibility in dark mode.
  static let defaultDark = ThemeRadioButtonSize(
    small: .init(
      size: ThemePlatform.current.radioButtonSize(for: .small),
      labelSpacing: ThemePlatform.current.radioButtonLabelSpacing(for: .small),
      font: ThemePlatform.current.radioButtonFontStyle(for: .small),
      stroke: ThemePlatform.current.radioButtonStrokeWidth(for: .small)
    ),
    medium: .init(
      size: ThemePlatform.current.radioButtonSize(for: .medium),
      labelSpacing: ThemePlatform.current.radioButtonLabelSpacing(for: .medium),
      font: ThemePlatform.current.radioButtonFontStyle(for: .medium),
      stroke: ThemePlatform.current.radioButtonStrokeWidth(for: .medium)
    ),
    large: .init(
      size: ThemePlatform.current.radioButtonSize(for: .large),
      labelSpacing: ThemePlatform.current.radioButtonLabelSpacing(for: .large),
      font: ThemePlatform.current.radioButtonFontStyle(for: .large),
      stroke: ThemePlatform.current.radioButtonStrokeWidth(for: .large)
    )
  )

  /// Returns the radio button configuration for the given size token.
  ///
  /// - Parameter token: The desired size category.
  /// - Returns: A `RadioButtonConfiguration` containing platform-specific sizing info.
  subscript(_ token: RadioButtonSizeToken) -> RadioButtonConfiguration {
    switch token {
    case .small: return self.small
    case .medium: return self.medium
    case .large: return self.large
    }
  }
}
