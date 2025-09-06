import XCTest
@testable import SwiftThemeKit

final class ThemeRadiiTests: XCTestCase {
  
  func testDefaultLightValues() {
    let radii = ThemeRadii.defaultLight
    
    XCTAssertEqual(radii.none, 0)
    XCTAssertEqual(radii.xs, 4)
    XCTAssertEqual(radii.sm, 8)
    XCTAssertEqual(radii.md, 12)
    XCTAssertEqual(radii.lg, 16)
    XCTAssertEqual(radii.xl, 28)
    XCTAssertEqual(radii.pill, 9999)
  }
  
  func testDefaultDarkEqualsLight() {
    let light = ThemeRadii.defaultLight
    let dark = ThemeRadii.defaultDark
    
    XCTAssertEqual(light.xs, dark.xs)
    XCTAssertEqual(light.sm, dark.sm)
    XCTAssertEqual(light.md, dark.md)
    XCTAssertEqual(light.lg, dark.lg)
    XCTAssertEqual(light.xl, dark.xl)
    XCTAssertEqual(light.pill, dark.pill)
  }
  
  func testSubscriptReturnsCorrectValues() {
    let radii = ThemeRadii(xs: 1, sm: 2, md: 3, lg: 4, xl: 5, pill: 6)
    
    XCTAssertEqual(radii[.none], 0)
    XCTAssertEqual(radii[.xs], 1)
    XCTAssertEqual(radii[.sm], 2)
    XCTAssertEqual(radii[.md], 3)
    XCTAssertEqual(radii[.lg], 4)
    XCTAssertEqual(radii[.xl], 5)
    XCTAssertEqual(radii[.pill], 6)
  }
}
