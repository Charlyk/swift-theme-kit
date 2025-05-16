import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftThemeKit

final class ThemeProviderTests: XCTestCase {
  
  func testAppliesLightThemeWhenColorSchemeIsLight() throws {
    let sut = ThemeProvider(light: .defaultLight, dark: .defaultDark) {
      Text("Hello Light")
    }
      .environment(\.colorScheme, .light)
    
    let view = try sut.inspect().view(ThemeProvider<Text>.self, 0)
    let envTheme = try view.actualView().lightTheme
    XCTAssertEqual(envTheme.colors.primary, Theme.defaultLight.colors.primary)
  }
  
  func testAppliesDarkThemeWhenColorSchemeIsDark() throws {
    let sut = ThemeProvider(light: .defaultLight, dark: .defaultDark) {
      Text("Hello Dark")
    }
      .environment(\.colorScheme, .dark)
    
    let view = try sut.inspect().view(ThemeProvider<Text>.self, 0)
    let envTheme = try view.actualView().darkTheme
    XCTAssertEqual(envTheme.colors.primary, Theme.defaultDark.colors.primary)
  }
  
  func testWrapsContentCorrectly() throws {
    let sut = ThemeProvider {
      Text("Themed Text")
    }
    
    let view = try sut.inspect().view(ThemeProvider<Text>.self, 0)
    let text = try view.actualView().content()
    XCTAssertEqual(text, Text("Themed Text"))
  }
}
