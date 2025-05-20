import Foundation

/// Represents the platform on which the app is currently running.
///
/// `ThemePlatform` allows SwiftThemeKit to apply platform-specific logic for
/// sizing, spacing, typography, and layout. For example, checkboxes or buttons
/// may have different base sizes and font styles depending on whether the app
/// runs on iOS, macOS, watchOS, or tvOS.
public enum ThemePlatform {

  /// The iOS platform (iPhone and iPad).
  case iOS

  /// The macOS platform (macOS apps and Catalyst).
  case macOS

  /// The watchOS platform (Apple Watch).
  case watchOS

  /// The tvOS platform (Apple TV).
  case tvOS

  /// Returns the platform the app is currently running on, determined at compile time.
  ///
  /// This is used internally by the theme to customize component sizes and spacing
  /// to match native platform conventions.
  ///
  /// - Returns: A `ThemePlatform` representing the current OS.
  public static var current: ThemePlatform {
    #if os(macOS)
    return .macOS
    #elseif os(iOS)
    return .iOS
    #elseif os(watchOS)
    return .watchOS
    #elseif os(tvOS)
    return .tvOS
    #else
    return .iOS // fallback
    #endif
  }
}
