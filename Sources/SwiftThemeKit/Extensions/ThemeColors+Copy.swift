import SwiftUI

public extension ThemeColors {
  /// Returns a new `ThemeColors` instance by copying the current one
  /// and applying the specified overrides.
  ///
  /// Only parameters you pass will be changed — others will retain existing values.
  func copy(
    primary: Color? = nil,
    onPrimary: Color? = nil,
    primaryContainer: Color? = nil,
    onPrimaryContainer: Color? = nil,
    
    secondary: Color? = nil,
    onSecondary: Color? = nil,
    secondaryContainer: Color? = nil,
    onSecondaryContainer: Color? = nil,
    
    tertiary: Color? = nil,
    onTertiary: Color? = nil,
    tertiaryContainer: Color? = nil,
    onTertiaryContainer: Color? = nil,
    
    background: Color? = nil,
    onBackground: Color? = nil,
    
    error: Color? = nil,
    onError: Color? = nil,
    errorContainer: Color? = nil,
    onErrorContainer: Color? = nil,
    
    inverseSurface: Color? = nil,
    inverseOnSurface: Color? = nil,
    inversePrimary: Color? = nil,
    
    surface: Color? = nil,
    onSurface: Color? = nil,
    surfaceVariant: Color? = nil,
    onSurfaceVariant: Color? = nil,
    
    surfaceDim: Color? = nil,
    surfaceBright: Color? = nil,
    surfaceContainerLowest: Color? = nil,
    surfaceContainerLow: Color? = nil,
    surfaceContainer: Color? = nil,
    surfaceContainerHigh: Color? = nil,
    surfaceContainerHighest: Color? = nil,
    
    outline: Color? = nil,
    outlineVariant: Color? = nil,
    scrim: Color? = nil,
    shadow: Color? = nil
  ) -> ThemeColors {
    ThemeColors(
      primary: primary ?? self.primary,
      onPrimary: onPrimary ?? self.onPrimary,
      primaryContainer: primaryContainer ?? self.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? self.onPrimaryContainer,
      
      secondary: secondary ?? self.secondary,
      onSecondary: onSecondary ?? self.onSecondary,
      secondaryContainer: secondaryContainer ?? self.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? self.onSecondaryContainer,
      
      tertiary: tertiary ?? self.tertiary,
      onTertiary: onTertiary ?? self.onTertiary,
      tertiaryContainer: tertiaryContainer ?? self.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? self.onTertiaryContainer,
      
      background: background ?? self.background,
      onBackground: onBackground ?? self.onBackground,
      
      error: error ?? self.error,
      onError: onError ?? self.onError,
      errorContainer: errorContainer ?? self.errorContainer,
      onErrorContainer: onErrorContainer ?? self.onErrorContainer,
      
      inverseSurface: inverseSurface ?? self.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? self.inverseOnSurface,
      inversePrimary: inversePrimary ?? self.inversePrimary,
      
      surface: surface ?? self.surface,
      onSurface: onSurface ?? self.onSurface,
      surfaceVariant: surfaceVariant ?? self.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? self.onSurfaceVariant,
      
      surfaceDim: surfaceDim ?? self.surfaceDim,
      surfaceBright: surfaceBright ?? self.surfaceBright,
      surfaceContainerLowest: surfaceContainerLowest ?? self.surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? self.surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? self.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? self.surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest ?? self.surfaceContainerHighest,
      
      outline: outline ?? self.outline,
      outlineVariant: outlineVariant ?? self.outlineVariant,
      scrim: scrim ?? self.scrim,
      shadow: shadow ?? self.shadow
    )
  }
}
