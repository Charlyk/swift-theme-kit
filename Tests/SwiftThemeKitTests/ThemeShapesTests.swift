import XCTest
import SwiftUI
@testable import SwiftThemeKit

final class ThemeShapesTests: XCTestCase {

  func testDefaultLightShapesUseCorrectRadii() {
    let shapes = ThemeShapes.defaultLight
    XCTAssertEqual(shapes.xs.cornerSize.width, ThemeRadii.defaultLight.xs)
    XCTAssertEqual(shapes.sm.cornerSize.width, ThemeRadii.defaultLight.sm)
    XCTAssertEqual(shapes.md.cornerSize.width, ThemeRadii.defaultLight.md)
    XCTAssertEqual(shapes.lg.cornerSize.width, ThemeRadii.defaultLight.lg)
    XCTAssertEqual(shapes.xl.cornerSize.width, ThemeRadii.defaultLight.xl)
  }

  func testDefaultDarkShapesUseCorrectRadii() {
    let shapes = ThemeShapes.defaultDark
    XCTAssertEqual(shapes.xs.cornerSize.width, ThemeRadii.defaultLight.xs)
    XCTAssertEqual(shapes.sm.cornerSize.width, ThemeRadii.defaultLight.sm)
    XCTAssertEqual(shapes.md.cornerSize.width, ThemeRadii.defaultLight.md)
    XCTAssertEqual(shapes.lg.cornerSize.width, ThemeRadii.defaultLight.lg)
    XCTAssertEqual(shapes.xl.cornerSize.width, ThemeRadii.defaultLight.xl)
  }

  func testShapeTokenSubscriptReturnsCorrectShape() {
    let customShapes = ThemeShapes(
      xs: RoundedRectangle(cornerRadius: 1),
      sm: RoundedRectangle(cornerRadius: 2),
      md: RoundedRectangle(cornerRadius: 3),
      lg: RoundedRectangle(cornerRadius: 4),
      xl: RoundedRectangle(cornerRadius: 5)
    )

    XCTAssertEqual(customShapes[.xs].cornerSize.width, 1)
    XCTAssertEqual(customShapes[.sm].cornerSize.width, 2)
    XCTAssertEqual(customShapes[.md].cornerSize.width, 3)
    XCTAssertEqual(customShapes[.lg].cornerSize.width, 4)
    XCTAssertEqual(customShapes[.xl].cornerSize.width, 5)
  }
}
