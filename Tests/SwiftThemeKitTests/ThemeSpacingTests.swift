import XCTest
@testable import SwiftThemeKit

final class ThemeSpacingTests: XCTestCase {

  func testDefaultLightSpacingValues() {
    let spacing = ThemeSpacing.defaultLight
    XCTAssertEqual(spacing.xs, 4)
    XCTAssertEqual(spacing.sm, 8)
    XCTAssertEqual(spacing.md, 16)
    XCTAssertEqual(spacing.lg, 32)
    XCTAssertEqual(spacing.xl, 48)
    XCTAssertEqual(spacing.xxl, 80)
  }

  func testDefaultDarkSpacingValues() {
    let spacing = ThemeSpacing.defaultDark
    XCTAssertEqual(spacing.xs, 4)
    XCTAssertEqual(spacing.sm, 8)
    XCTAssertEqual(spacing.md, 16)
    XCTAssertEqual(spacing.lg, 32)
    XCTAssertEqual(spacing.xl, 48)
    XCTAssertEqual(spacing.xxl, 80)
  }

  func testSpacingTokenSubscriptReturnsCorrectValues() {
    let custom = ThemeSpacing(xs: 1, sm: 2, md: 3, lg: 4, xl: 5, xxl: 6)

    XCTAssertEqual(custom[.xs], 1)
    XCTAssertEqual(custom[.sm], 2)
    XCTAssertEqual(custom[.md], 3)
    XCTAssertEqual(custom[.lg], 4)
    XCTAssertEqual(custom[.xl], 5)
    XCTAssertEqual(custom[.xxl], 6)
  }
}
