import SwiftUI

/// Represents the available size tokens for a checkbox component.
///
/// Use this enum to configure the size of a checkbox when applying modifiers or creating custom styles.
public enum CheckboxSizeToken: String, CaseIterable, Equatable {
  /// A small checkbox. Optimized for compact UIs or dense layouts.
  case small

  /// A medium checkbox. Suitable for standard form controls and settings.
  case medium

  /// A large checkbox. Ideal for touch interfaces, TV platforms, or accessibility.
  case large
}

/// Defines the layout configuration for a checkbox at different size levels.
///
/// `ThemeCheckboxSize` stores the configuration for small, medium, and large checkboxes,
/// including their visual size, stroke width, font style, and label spacing. The actual
/// values are platform-specific and retrieved from `ThemePlatform`.
///
/// This struct is injected through the current theme, allowing consistent sizing across the app.
public struct ThemeCheckboxSize: Equatable {

  /// Checkbox configuration for `.small` size.
  ///
  /// - Size: Compact box.
  /// - Font: Smaller label typography.
  /// - Label spacing: Tight spacing between box and text.
  let small: CheckboxConfiguration

  /// Checkbox configuration for `.medium` size.
  ///
  /// - Size: Standard checkbox.
  /// - Font: Medium body typography.
  /// - Label spacing: Balanced layout for most use cases.
  let medium: CheckboxConfiguration

  /// Checkbox configuration for `.large` size.
  ///
  /// - Size: Enlarged for accessibility or large screens.
  /// - Font: Larger, prominent typography.
  /// - Label spacing: Generous spacing for clarity.
  let large: CheckboxConfiguration

  /// The default checkbox sizing configuration for light themes.
  ///
  /// Sizing values are computed using `ThemePlatform` based on the current platform (iOS, macOS, etc.).
  static let defaultLight = ThemeCheckboxSize(
    small: .init(
      size: ThemePlatform.current.checkboxSize(for: .small),
      labelSpacing: ThemePlatform.current.checkboxLabelSpacing(for: .small),
      font: ThemePlatform.current.checkboxFontStyle(for: .small),
      stroke: ThemePlatform.current.checkboxStrokeWidth(for: .small)
    ),
    medium: .init(
      size: ThemePlatform.current.checkboxSize(for: .medium),
      labelSpacing: ThemePlatform.current.checkboxLabelSpacing(for: .medium),
      font: ThemePlatform.current.checkboxFontStyle(for: .medium),
      stroke: ThemePlatform.current.checkboxStrokeWidth(for: .medium)
    ),
    large: .init(
      size: ThemePlatform.current.checkboxSize(for: .large),
      labelSpacing: ThemePlatform.current.checkboxLabelSpacing(for: .large),
      font: ThemePlatform.current.checkboxFontStyle(for: .large),
      stroke: ThemePlatform.current.checkboxStrokeWidth(for: .large)
    )
  )

  /// The default checkbox sizing configuration for dark themes.
  ///
  /// The label spacing and stroke may differ slightly to improve contrast and accessibility in dark mode.
  static let defaultDark = ThemeCheckboxSize(
    small: .init(
      size: ThemePlatform.current.checkboxSize(for: .small),
      labelSpacing: ThemePlatform.current.checkboxLabelSpacing(for: .small),
      font: ThemePlatform.current.checkboxFontStyle(for: .small),
      stroke: ThemePlatform.current.checkboxStrokeWidth(for: .small)
    ),
    medium: .init(
      size: ThemePlatform.current.checkboxSize(for: .medium),
      labelSpacing: ThemePlatform.current.checkboxLabelSpacing(for: .medium),
      font: ThemePlatform.current.checkboxFontStyle(for: .medium),
      stroke: ThemePlatform.current.checkboxStrokeWidth(for: .medium)
    ),
    large: .init(
      size: ThemePlatform.current.checkboxSize(for: .large),
      labelSpacing: ThemePlatform.current.checkboxLabelSpacing(for: .large),
      font: ThemePlatform.current.checkboxFontStyle(for: .large),
      stroke: ThemePlatform.current.checkboxStrokeWidth(for: .large)
    )
  )

  /// Returns the checkbox configuration for the given size token.
  ///
  /// - Parameter token: The desired size category.
  /// - Returns: A `CheckboxConfiguration` containing platform-specific sizing info.
  subscript(_ token: CheckboxSizeToken) -> CheckboxConfiguration {
    switch token {
    case .small: return self.small
    case .medium: return self.medium
    case .large: return self.large
    }
  }
}
