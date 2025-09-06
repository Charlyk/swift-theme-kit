import SwiftUI

extension ThemePlatform {
  /// Returns the base checkbox size (in points) depending on the current platform.
  ///
  /// This value acts as a scaling anchor for all checkbox sizing in SwiftThemeKit.
  ///
  /// - macOS: 18pt
  /// - iOS/watchOS: 22pt
  /// - tvOS: 30pt
  ///
  /// - Returns: The platform-specific base size for checkboxes.
  func baseRadioButtonSize() -> CGFloat {
    switch self {
    case .macOS: return 18
    case .iOS, .watchOS: return 22
    case .tvOS: return 30
    }
  }

  /// Computes the final checkbox size based on the size token and platform.
  ///
  /// The returned size is scaled proportionally from the base size per platform.
  ///
  /// - Parameter sizeCategory: The desired size token (`.small`, `.medium`, `.large`).
  /// - Returns: The actual rendered size of the checkbox.
  func radioButtonSize(for sizeCategory: RadioButtonSizeToken) -> CGFloat {
    let base = baseRadioButtonSize()
    switch sizeCategory {
    case .small:
      return base
    case .medium:
      return base * 1.15
    case .large:
      return base * 1.15 * 1.15
    }
  }

  /// Resolves the appropriate typography token for the checkbox label based on size and platform.
  ///
  /// This ensures font scaling matches platform expectations for readability and visual balance.
  ///
  /// - Parameter sizeCategory: The selected size token.
  /// - Returns: A `TextStyleToken` representing the font style to apply to the label.
  func radioButtonFontStyle(for sizeCategory: RadioButtonSizeToken) -> TextStyleToken {
    switch self {
    case .macOS:
      switch sizeCategory {
      case .small:
        return .labelMedium      // ~12pt
      case .medium:
        return .bodySmall        // ~14pt
      case .large:
        return .bodyMedium       // ~16pt
      }

    case .iOS, .watchOS:
      switch sizeCategory {
      case .small:
        return .bodySmall        // ~14pt
      case .medium:
        return .bodyMedium       // ~16pt
      case .large:
        return .headlineSmall    // ~18pt
      }

    case .tvOS:
      switch sizeCategory {
      case .small:
        return .bodyMedium       // ~16pt
      case .medium:
        return .headlineSmall    // ~18pt
      case .large:
        return .headlineMedium   // ~20pt
      }
    }
  }

  /// Returns the spacing between the checkbox and its label, scaled for platform and size.
  ///
  /// This ensures consistent spacing across devices while allowing for more room
  /// on touch interfaces or large screen layouts like tvOS.
  ///
  /// - Parameter sizeCategory: The checkbox size token.
  /// - Returns: A `SpacingToken` representing horizontal spacing between checkbox and label.
  func radioButtonLabelSpacing(for sizeCategory: RadioButtonSizeToken) -> SpacingToken {
    switch self {
    case .macOS:
      switch sizeCategory {
      case .small: return .xs    // ~4pt
      case .medium: return .sm   // ~8pt
      case .large: return .sm    // ~8pt (macOS keeps spacing tight)
      }

    case .iOS, .watchOS:
      switch sizeCategory {
      case .small: return .sm    // ~8pt
      case .medium: return .md   // ~16pt
      case .large: return .md    // ~16pt
      }

    case .tvOS:
      switch sizeCategory {
      case .small: return .md    // ~16pt
      case .medium: return .lg   // ~32pt
      case .large: return .lg    // ~32pt
      }
    }
  }

  /// Returns the stroke width to use for the radio button border depending on size and platform.
  ///
  /// Larger checkboxes get thicker strokes, and platform styles vary to match system expectations.
  ///
  /// - Parameter sizeCategory: The selected size token.
  /// - Returns: A `StrokeToken` indicating the appropriate border thickness.
  func radioButtonStrokeWidth(for sizeCategory: RadioButtonSizeToken) -> StrokeToken {
    switch self {
    case .macOS:
      switch sizeCategory {
      case .small:
        return .xs    // ~1pt (very thin)
      case .medium, .large:
        return .sm    // ~2pt
      }

    case .iOS, .watchOS:
      switch sizeCategory {
      case .small:
        return .sm    // ~2pt
      case .medium, .large:
        return .md    // ~4pt
      }

    case .tvOS:
      switch sizeCategory {
      case .small:
        return .sm    // ~2pt
      case .medium, .large:
        return .md    // ~4pt
      }
    }
  }
}
