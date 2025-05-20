import SwiftUI

/// A struct that defines all semantic colors used across the UI theme.
///
/// Colors follow the Material Design 3 specification and are resolved from a `Theme`.
/// These values can be accessed via environment using `@Environment(\.appTheme).colors`
/// or via subscript using a `ColorToken`.
public struct ThemeColors {
  // MARK: - Primary

  /// Primary brand color. Used for filled buttons, toggles, sliders, and active states.
  public let primary: Color

  /// Foreground color for content displayed on top of the primary color.
  /// Used in filled buttons, icons, and text on `primary`.
  public let onPrimary: Color

  /// A container version of `primary`. Used for tonal buttons and cards.
  public let primaryContainer: Color

  /// Foreground color for content on `primaryContainer`.
  public let onPrimaryContainer: Color

  // MARK: - Secondary

  /// Secondary brand color. Used for complementary accents and UI elements.
  public let secondary: Color

  /// Foreground color on `secondary`.
  public let onSecondary: Color

  /// Container version of `secondary`. Used in tonal buttons and backgrounds.
  public let secondaryContainer: Color

  /// Foreground color for content on `secondaryContainer`.
  public let onSecondaryContainer: Color

  // MARK: - Tertiary

  /// Tertiary color used for less prominent accents and optional areas of UI.
  public let tertiary: Color

  /// Foreground color on `tertiary`.
  public let onTertiary: Color

  /// Container version of `tertiary`. Often used in tertiary or tonal button variants.
  public let tertiaryContainer: Color

  /// Foreground color for content on `tertiaryContainer`.
  public let onTertiaryContainer: Color

  // MARK: - Background

  /// General background color for screens and surfaces.
  public let background: Color

  /// Foreground color for content placed directly on the background.
  public let onBackground: Color

  // MARK: - Error

  /// The error color used to indicate critical states or invalid input.
  /// Used in buttons with role `.destructive`, text field error states, etc.
  public let error: Color

  /// Foreground color for content on top of the `error` color.
  public let onError: Color

  /// Container version of `error`. Used in buttons, alerts, and error highlights.
  public let errorContainer: Color

  /// Foreground color for content on `errorContainer`.
  public let onErrorContainer: Color

  // MARK: - Inverse

  /// Surface color used for inverse components (e.g., bottom sheets, overlays).
  public let inverseSurface: Color

  /// Foreground color used on top of `inverseSurface`.
  public let inverseOnSurface: Color

  /// Primary brand color adapted for use on inverse surfaces.
  public let inversePrimary: Color

  // MARK: - Surface

  /// Base surface color. Used for cards, sheets, dialogs, and containers.
  public let surface: Color

  /// Foreground content (text, icons) on top of `surface`.
  public let onSurface: Color

  /// A variant of the surface used for borders, dividers, and low-emphasis backgrounds.
  public let surfaceVariant: Color

  /// Foreground color for content on `surfaceVariant`.
  public let onSurfaceVariant: Color

  /// Used for dimmed surface backgrounds (e.g., navigation bars or background states).
  public let surfaceDim: Color

  /// Used for bright surface states (e.g., elevated containers).
  public let surfaceBright: Color

  /// The lowest elevation container surface (typically full-white or full-black).
  public let surfaceContainerLowest: Color

  /// Low-elevation container surface (1dp–2dp).
  public let surfaceContainerLow: Color

  /// Medium-elevation container surface (3dp–4dp).
  public let surfaceContainer: Color

  /// High-elevation container surface (6dp–8dp).
  public let surfaceContainerHigh: Color

  /// Highest-elevation container surface (above 8dp).
  public let surfaceContainerHighest: Color

  // MARK: - Outline & Utility

  /// Used for strokes, borders, and outlines (1dp emphasis).
  public let outline: Color

  /// A lower-contrast version of `outline`. Used for less prominent borders or visual separation.
  public let outlineVariant: Color

  /// Used to block interaction (e.g., modal scrims or overlays).
  public let scrim: Color

  /// The shadow color used in elevation and shadow rendering.
  public let shadow: Color

  public static let defaultLight = ThemeColors(
    primary: .init(hex: "#5F5791"),
    onPrimary: .init(hex: "#FFFFFF"),
    primaryContainer: .init(hex: "#E5DEFF"),
    onPrimaryContainer: .init(hex: "#473F77"),
    secondary: .init(hex: "#00687C"),
    onSecondary: .init(hex: "#FFFFFF"),
    secondaryContainer: .init(hex: "#B0ECFF"),
    onSecondaryContainer: .init(hex: "#004E5E"),
    tertiary: .init(hex: "#2A6A47"),
    onTertiary: .init(hex: "#FFFFFF"),
    tertiaryContainer: .init(hex: "#AEF2C5"),
    onTertiaryContainer: .init(hex: "#0A5131"),
    background: .init(hex: "#5F5791"),
    onBackground: .init(hex: "#5F5791"),
    error: .init(hex: "#904B3B"),
    onError: .init(hex: "#FFFFFF"),
    errorContainer: .init(hex: "#FFDAD2"),
    onErrorContainer: .init(hex: "#733426"),
    inverseSurface: .init(hex: "#2B3133"),
    inverseOnSurface: .init(hex: "#ECF2F4"),
    inversePrimary: .init(hex: "#C8BFFF"),
    surface: .init(hex: "#F5FAFC"),
    onSurface: .init(hex: "#171C1E"),
    surfaceVariant: .init(hex: "#DBE4E7"),
    onSurfaceVariant: .init(hex: "#3F484B"),
    surfaceDim: .init(hex: "#5DBDD"),
    surfaceBright: .init(hex: "#F5FAFC"),
    surfaceContainerLowest: .init(hex: "#FFFFFF"),
    surfaceContainerLow: .init(hex: "#EFF4F6"),
    surfaceContainer: .init(hex: "#E9EFF1"),
    surfaceContainerHigh: .init(hex: "#E4E9EB"),
    surfaceContainerHighest: .init(hex: "#DEE3E5"),
    outline: .init(hex: "#6F797B"),
    outlineVariant: .init(hex: "#BFC8CB"),
    scrim: .init(hex: "#000000"),
    shadow: .init(hex: "#6941C6")
  )

  public static let defaultDark = ThemeColors(
    primary: .init(hex: "#F3EDFF"),
    onPrimary: .init(hex: "#30285F"),
    primaryContainer: .init(hex: "#473F77"),
    onPrimaryContainer: .init(hex: "#E5DEFF"),
    secondary: .init(hex: "#85D1E8"),
    onSecondary: .init(hex: "#003641"),
    secondaryContainer: .init(hex: "#004E5E"),
    onSecondaryContainer: .init(hex: "#B0ECFF"),
    tertiary: .init(hex: "#93D5AA"),
    onTertiary: .init(hex: "#00391F"),
    tertiaryContainer: .init(hex: "#0A5131"),
    onTertiaryContainer: .init(hex: "#AEF2C5"),
    background: .init(hex: "#141318"),
    onBackground: .init(hex: "#E5E1E9"),
    error: .init(hex: "#FFB4A3"),
    onError: .init(hex: "#561F12"),
    errorContainer: .init(hex: "#733426"),
    onErrorContainer: .init(hex: "#FFDAD2"),
    inverseSurface: .init(hex: "#DEE3E5"),
    inverseOnSurface: .init(hex: "#2B3133"),
    inversePrimary: .init(hex: "#5F5791"),
    surface: .init(hex: "#0F1416"),
    onSurface: .init(hex: "#DEE3E5"),
    surfaceVariant: .init(hex: "#3F484B"),
    onSurfaceVariant: .init(hex: "#BFC8CB"),
    surfaceDim: .init(hex: "#0F1416"),
    surfaceBright: .init(hex: "#343A3C"),
    surfaceContainerLowest: .init(hex: "#090F11"),
    surfaceContainerLow: .init(hex: "#171C1E"),
    surfaceContainer: .init(hex: "#1B2122"),
    surfaceContainerHigh: .init(hex: "#252B2D"),
    surfaceContainerHighest: .init(hex: "#303637"),
    outline: .init(hex: "#899295"),
    outlineVariant: .init(hex: "#3F484B"),
    scrim: .init(hex: "#000000"),
    shadow: .init(hex: "#B692F6")
  )

  public init(
    primary: Color,
    onPrimary: Color,
    primaryContainer: Color,
    onPrimaryContainer: Color,
    secondary: Color,
    onSecondary: Color,
    secondaryContainer: Color,
    onSecondaryContainer: Color,
    tertiary: Color,
    onTertiary: Color,
    tertiaryContainer: Color,
    onTertiaryContainer: Color,
    background: Color,
    onBackground: Color,
    error: Color,
    onError: Color,
    errorContainer: Color,
    onErrorContainer: Color,
    inverseSurface: Color,
    inverseOnSurface: Color,
    inversePrimary: Color,
    surface: Color,
    onSurface: Color,
    surfaceVariant: Color,
    onSurfaceVariant: Color,
    surfaceDim: Color,
    surfaceBright: Color,
    surfaceContainerLowest: Color,
    surfaceContainerLow: Color,
    surfaceContainer: Color,
    surfaceContainerHigh: Color,
    surfaceContainerHighest: Color,
    outline: Color,
    outlineVariant: Color,
    scrim: Color,
    shadow: Color
  ) {
    self.primary = primary
    self.onPrimary = onPrimary
    self.primaryContainer = primaryContainer
    self.onPrimaryContainer = onPrimaryContainer
    self.secondary = secondary
    self.onSecondary = onSecondary
    self.secondaryContainer = secondaryContainer
    self.onSecondaryContainer = onSecondaryContainer
    self.tertiary = tertiary
    self.onTertiary = onTertiary
    self.tertiaryContainer = tertiaryContainer
    self.onTertiaryContainer = onTertiaryContainer
    self.background = background
    self.onBackground = onBackground
    self.error = error
    self.onError = onError
    self.errorContainer = errorContainer
    self.onErrorContainer = onErrorContainer
    self.inverseSurface = inverseSurface
    self.inverseOnSurface = inverseOnSurface
    self.inversePrimary = inversePrimary
    self.surface = surface
    self.onSurface = onSurface
    self.surfaceVariant = surfaceVariant
    self.onSurfaceVariant = onSurfaceVariant
    self.surfaceDim = surfaceDim
    self.surfaceBright = surfaceBright
    self.surfaceContainerLowest = surfaceContainerLowest
    self.surfaceContainerLow = surfaceContainerLow
    self.surfaceContainer = surfaceContainer
    self.surfaceContainerHigh = surfaceContainerHigh
    self.surfaceContainerHighest = surfaceContainerHighest
    self.outline = outline
    self.outlineVariant = outlineVariant
    self.scrim = scrim
    self.shadow = shadow
  }

  /// Accesses the color via a `ColorToken`.
  ///
  /// Example:
  /// ```swift
  /// theme.colors[.primary]
  /// ```
  subscript(_ token: ColorToken) -> Color {
    switch token {
    case .primary: return primary
    case .onPrimary: return onPrimary
    case .primaryContainer: return primaryContainer
    case .onPrimaryContainer: return onPrimaryContainer

    case .secondary: return secondary
    case .onSecondary: return onSecondary
    case .secondaryContainer: return secondaryContainer
    case .onSecondaryContainer: return onSecondaryContainer

    case .tertiary: return tertiary
    case .onTertiary: return onTertiary
    case .tertiaryContainer: return tertiaryContainer
    case .onTertiaryContainer: return onTertiaryContainer

    case .background: return background
    case .onBackground: return onBackground

    case .error: return error
    case .onError: return onError
    case .errorContainer: return errorContainer
    case .onErrorContainer: return onErrorContainer

    case .inverseSurface: return inverseSurface
    case .inverseOnSurface: return inverseOnSurface
    case .inversePrimary: return inversePrimary

    case .surface: return surface
    case .onSurface: return onSurface
    case .surfaceVariant: return surfaceVariant
    case .onSurfaceVariant: return onSurfaceVariant

    case .surfaceDim: return surfaceDim
    case .surfaceBright: return surfaceBright

    case .surfaceContainerLowest: return surfaceContainerLowest
    case .surfaceContainerLow: return surfaceContainerLow
    case .surfaceContainer: return surfaceContainer
    case .surfaceContainerHigh: return surfaceContainerHigh
    case .surfaceContainerHighest: return surfaceContainerHighest

    case .outline: return outline
    case .outlineVariant: return outlineVariant
    case .scrim: return scrim
    case .shadow: return shadow
    }
  }
}

public enum ColorToken: String, CaseIterable {
  case primary, onPrimary, primaryContainer, onPrimaryContainer
  case secondary, onSecondary, secondaryContainer, onSecondaryContainer
  case tertiary, onTertiary, tertiaryContainer, onTertiaryContainer
  case background, onBackground
  case error, onError, errorContainer, onErrorContainer
  case inverseSurface, inverseOnSurface, inversePrimary
  case surface, onSurface, surfaceVariant, onSurfaceVariant
  case surfaceDim, surfaceBright
  case surfaceContainerLowest, surfaceContainerLow, surfaceContainer, surfaceContainerHigh, surfaceContainerHighest
  case outline, outlineVariant, scrim, shadow
}
