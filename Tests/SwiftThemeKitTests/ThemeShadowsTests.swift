import XCTest
import SwiftUI
@testable import SwiftThemeKit

final class ThemeShadowsTests: XCTestCase {

  func testDefaultLightShadows() {
    let shadows = ThemeShadows.defaultLight

    XCTAssertEqual(shadows.none, ThemeShadow(color: .clear, radius: 0, x: 0, y: 0))
    XCTAssertEqual(shadows.sm, ThemeShadow(color: .black.opacity(0.12), radius: 1, x: 0, y: 1))
    XCTAssertEqual(shadows.md, ThemeShadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 4))
    XCTAssertEqual(shadows.lg, ThemeShadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 8))

    let expectedFocusColor = ThemeColors.defaultLight.shadow.opacity(0.3)
    XCTAssertEqual(shadows.focus.color.description, expectedFocusColor.description)
    XCTAssertEqual(shadows.focus.radius, 3)
    XCTAssertEqual(shadows.focus.x, 0)
    XCTAssertEqual(shadows.focus.y, 0)
  }

  func testDefaultDarkShadows() {
    let shadows = ThemeShadows.defaultDark

    XCTAssertEqual(shadows.none, ThemeShadow(color: .clear, radius: 0, x: 0, y: 0))
    XCTAssertEqual(shadows.sm, ThemeShadow(color: .white.opacity(0.05), radius: 1, x: 0, y: 1))
    XCTAssertEqual(shadows.md, ThemeShadow(color: .white.opacity(0.06), radius: 4, x: 0, y: 4))
    XCTAssertEqual(shadows.lg, ThemeShadow(color: .white.opacity(0.07), radius: 8, x: 0, y: 8))

    let expectedFocusColor = ThemeColors.defaultDark.shadow.opacity(0.3)
    XCTAssertEqual(shadows.focus.color.description, expectedFocusColor.description)
    XCTAssertEqual(shadows.focus.radius, 3)
    XCTAssertEqual(shadows.focus.x, 0)
    XCTAssertEqual(shadows.focus.y, 0)
  }

  func testCustomShadowSubscript() {
    let sm = ThemeShadow(color: .red, radius: 1, x: 0, y: 1)
    let md = ThemeShadow(color: .green, radius: 2, x: 0, y: 2)
    let lg = ThemeShadow(color: .blue, radius: 3, x: 0, y: 3)
    let focus = ThemeShadow(color: .orange, radius: 4, x: 0, y: 0)
    let none = ThemeShadow(color: .clear, radius: 0, x: 0, y: 0)

    let shadows = ThemeShadows(sm: sm, md: md, lg: lg, focus: focus, none: none)

    XCTAssertEqual(shadows[.sm], sm)
    XCTAssertEqual(shadows[.md], md)
    XCTAssertEqual(shadows[.lg], lg)
    XCTAssertEqual(shadows[.focus], focus)
    XCTAssertEqual(shadows[.none], none)
  }
}
