import XCTest
import SwiftUI
@testable import SwiftThemeKit

final class ThemeColorsTests: XCTestCase {
  
  func testAllColorTokensReturnExpectedColors() {
    let theme = ThemeColors.defaultLight
    let mirror = Mirror(reflecting: theme)
    
    for case let (label?, value) in mirror.children {
      guard let color = value as? Color else {
        XCTFail("Property \(label) is not of type Color")
        continue
      }
      
      // Attempt to resolve Color (just to ensure it's instantiable)
      _ = UIColor(color)
      
      // Optional: print token + hex debugging
      // print("\(label): \(color)")
    }
  }
  
  func testAllColorTokensAreMappedCorrectly() {
    let theme = ThemeColors.defaultLight
    
    XCTAssertEqual(theme[.primary], theme.primary)
    XCTAssertEqual(theme[.onPrimary], theme.onPrimary)
    XCTAssertEqual(theme[.primaryContainer], theme.primaryContainer)
    XCTAssertEqual(theme[.onPrimaryContainer], theme.onPrimaryContainer)
    
    XCTAssertEqual(theme[.secondary], theme.secondary)
    XCTAssertEqual(theme[.onSecondary], theme.onSecondary)
    XCTAssertEqual(theme[.secondaryContainer], theme.secondaryContainer)
    XCTAssertEqual(theme[.onSecondaryContainer], theme.onSecondaryContainer)
    
    XCTAssertEqual(theme[.tertiary], theme.tertiary)
    XCTAssertEqual(theme[.onTertiary], theme.onTertiary)
    XCTAssertEqual(theme[.tertiaryContainer], theme.tertiaryContainer)
    XCTAssertEqual(theme[.onTertiaryContainer], theme.onTertiaryContainer)
    
    XCTAssertEqual(theme[.background], theme.background)
    XCTAssertEqual(theme[.onBackground], theme.onBackground)
    
    XCTAssertEqual(theme[.error], theme.error)
    XCTAssertEqual(theme[.onError], theme.onError)
    XCTAssertEqual(theme[.errorContainer], theme.errorContainer)
    XCTAssertEqual(theme[.onErrorContainer], theme.onErrorContainer)
    
    XCTAssertEqual(theme[.inverseSurface], theme.inverseSurface)
    XCTAssertEqual(theme[.inverseOnSurface], theme.inverseOnSurface)
    XCTAssertEqual(theme[.inversePrimary], theme.inversePrimary)
    
    XCTAssertEqual(theme[.surface], theme.surface)
    XCTAssertEqual(theme[.onSurface], theme.onSurface)
    XCTAssertEqual(theme[.surfaceVariant], theme.surfaceVariant)
    XCTAssertEqual(theme[.onSurfaceVariant], theme.onSurfaceVariant)
    
    XCTAssertEqual(theme[.surfaceDim], theme.surfaceDim)
    XCTAssertEqual(theme[.surfaceBright], theme.surfaceBright)
    
    XCTAssertEqual(theme[.surfaceContainerLowest], theme.surfaceContainerLowest)
    XCTAssertEqual(theme[.surfaceContainerLow], theme.surfaceContainerLow)
    XCTAssertEqual(theme[.surfaceContainer], theme.surfaceContainer)
    XCTAssertEqual(theme[.surfaceContainerHigh], theme.surfaceContainerHigh)
    XCTAssertEqual(theme[.surfaceContainerHighest], theme.surfaceContainerHighest)
    
    XCTAssertEqual(theme[.outline], theme.outline)
    XCTAssertEqual(theme[.outlineVariant], theme.outlineVariant)
    XCTAssertEqual(theme[.scrim], theme.scrim)
    XCTAssertEqual(theme[.shadow], theme.shadow)
  }
  
  func testDarkThemeSubscriptMapping() {
    let theme = ThemeColors.defaultDark
    XCTAssertEqual(theme[.primary], theme.primary)
    XCTAssertEqual(theme[.onSurface], theme.onSurface)
    XCTAssertEqual(theme[.shadow], theme.shadow)
  }
}
