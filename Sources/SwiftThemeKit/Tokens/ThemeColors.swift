import SwiftUI

public struct ThemeColors {
  
  // MARK: - Primary
  public let primary: Color
  public let onPrimary: Color
  public let primaryContainer: Color
  public let onPrimaryContainer: Color
  
  // MARK: - Secondary
  public let secondary: Color
  public let onSecondary: Color
  public let secondaryContainer: Color
  public let onSecondaryContainer: Color
  
  // MARK: - Tertiary
  public let tertiary: Color
  public let onTertiary: Color
  public let tertiaryContainer: Color
  public let onTertiaryContainer: Color
  
  public let background: Color
  public let onBackground: Color
  
  // MARK: - Error
  public let error: Color
  public let onError: Color
  public let errorContainer: Color
  public let onErrorContainer: Color
  
  // MARK: - Inverse
  public let inverseSurface: Color
  public let inverseOnSurface: Color
  public let inversePrimary: Color
  
  // MARK: - Surface
  public let surface: Color
  public let onSurface: Color
  public let surfaceVariant: Color
  public let onSurfaceVariant: Color
  
  public let surfaceDim: Color
  public let surfaceBright: Color
  public let surfaceContainerLowest: Color
  public let surfaceContainerLow: Color
  public let surfaceContainer: Color
  public let surfaceContainerHigh: Color
  public let surfaceContainerHighest: Color
  
  // MARK: - Outline & Utility
  public let outline: Color
  public let outlineVariant: Color
  public let scrim: Color
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
