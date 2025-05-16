import XCTest
@testable import SwiftThemeKit

final class ThemeStrokeTests: XCTestCase {

  func testDefaultLightStrokeValues() {
    let stroke = ThemeStroke.defaultLignt
    XCTAssertEqual(stroke.none, 0)
    XCTAssertEqual(stroke.xs, 1)
    XCTAssertEqual(stroke.sm, 2)
    XCTAssertEqual(stroke.md, 4)
    XCTAssertEqual(stroke.lg, 8)
  }

  func testDefaultDarkStrokeValues() {
    let stroke = ThemeStroke.defaultDark
    XCTAssertEqual(stroke.none, 0)
    XCTAssertEqual(stroke.xs, 1)
    XCTAssertEqual(stroke.sm, 2)
    XCTAssertEqual(stroke.md, 4)
    XCTAssertEqual(stroke.lg, 8)
  }

  func testStrokeTokenSubscriptReturnsCorrectValues() {
    let custom = ThemeStroke(none: 10, xs: 11, sm: 12, md: 13, lg: 14)

    XCTAssertEqual(custom[.none], 10)
    XCTAssertEqual(custom[.xs], 11)
    XCTAssertEqual(custom[.sm], 12)
    XCTAssertEqual(custom[.md], 13)
    XCTAssertEqual(custom[.lg], 14)
  }
}
