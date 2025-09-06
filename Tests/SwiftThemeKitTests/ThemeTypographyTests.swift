import XCTest
import SwiftUI
@testable import SwiftThemeKit

final class ThemeTypographyTests: XCTestCase {

  func testDefaultLightTypographyTokens() {
    let typography = ThemeTypography.defaultLight

    XCTAssertEqual(typography[.displayLarge], typography.displayLarge)
    XCTAssertEqual(typography[.displayMedium], typography.displayMedium)
    XCTAssertEqual(typography[.displaySmall], typography.displaySmall)

    XCTAssertEqual(typography[.headlineLarge], typography.headlineLarge)
    XCTAssertEqual(typography[.headlineMedium], typography.headlineMedium)
    XCTAssertEqual(typography[.headlineSmall], typography.headlineSmall)

    XCTAssertEqual(typography[.titleLarge], typography.titleLarge)
    XCTAssertEqual(typography[.titleMedium], typography.titleMedium)
    XCTAssertEqual(typography[.titleSmall], typography.titleSmall)

    XCTAssertEqual(typography[.labelLarge], typography.labelLarge)
    XCTAssertEqual(typography[.labelMedium], typography.labelMedium)
    XCTAssertEqual(typography[.labelSmall], typography.labelSmall)

    XCTAssertEqual(typography[.bodyLarge], typography.bodyLarge)
    XCTAssertEqual(typography[.bodyMedium], typography.bodyMedium)
    XCTAssertEqual(typography[.bodySmall], typography.bodySmall)

    XCTAssertEqual(typography[.buttonText], typography.buttonText)
  }

  func testDefaultDarkTypographyTokens() {
    let typography = ThemeTypography.defaultDark

    XCTAssertEqual(typography[.displayLarge], typography.displayLarge)
    XCTAssertEqual(typography[.displayMedium], typography.displayMedium)
    XCTAssertEqual(typography[.displaySmall], typography.displaySmall)

    XCTAssertEqual(typography[.headlineLarge], typography.headlineLarge)
    XCTAssertEqual(typography[.headlineMedium], typography.headlineMedium)
    XCTAssertEqual(typography[.headlineSmall], typography.headlineSmall)

    XCTAssertEqual(typography[.titleLarge], typography.titleLarge)
    XCTAssertEqual(typography[.titleMedium], typography.titleMedium)
    XCTAssertEqual(typography[.titleSmall], typography.titleSmall)

    XCTAssertEqual(typography[.labelLarge], typography.labelLarge)
    XCTAssertEqual(typography[.labelMedium], typography.labelMedium)
    XCTAssertEqual(typography[.labelSmall], typography.labelSmall)

    XCTAssertEqual(typography[.bodyLarge], typography.bodyLarge)
    XCTAssertEqual(typography[.bodyMedium], typography.bodyMedium)
    XCTAssertEqual(typography[.bodySmall], typography.bodySmall)

    XCTAssertEqual(typography[.buttonText], typography.buttonText)
  }

  func testThemeFontTokenInitializesCorrectly() {
    let token = ThemeFontToken(.headlineLarge, weight: .bold)
    XCTAssertEqual(token.style, .headlineLarge)
    XCTAssertEqual(token.weight, .bold)
  }
}
