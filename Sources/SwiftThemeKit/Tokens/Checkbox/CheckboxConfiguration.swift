import SwiftUI

/// A struct that defines the visual and layout configuration for a checkbox of a specific size.
///
/// `CheckboxConfiguration` is used internally by `ThemeCheckboxSize` to encapsulate
/// the size, font, spacing, and border stroke width of a checkbox. These values are
/// platform-aware and resolved through `ThemePlatform`.
public struct CheckboxConfiguration: Equatable {

  /// The width and height of the checkbox box (square) in points.
  ///
  /// This controls the size of the tappable/selectable region.
  public let size: CGFloat

  /// The horizontal spacing between the checkbox box and its label.
  ///
  /// This is typically defined by a `SpacingToken` like `.sm`, `.md`, etc.,
  /// to keep spacing consistent across the system.
  public let labelSpacing: SpacingToken

  /// The typography token used for the checkbox label.
  ///
  /// This defines the font size, weight, and line height for the associated label text.
  public let font: TextStyleToken

  /// The stroke thickness applied to the checkbox border.
  ///
  /// This is defined using a `StrokeToken` and varies depending on size and platform.
  public let stroke: StrokeToken

  /// Creates a new `CheckboxConfiguration` with the specified size, spacing, font, and stroke.
  ///
  /// - Parameters:
  ///   - size: The square size of the checkbox in points.
  ///   - labelSpacing: The spacing between checkbox and label.
  ///   - font: The typography style for the label.
  ///   - stroke: The border thickness of the checkbox.
  public init(
    size: CGFloat,
    labelSpacing: SpacingToken,
    font: TextStyleToken,
    stroke: StrokeToken
  ) {
    self.size = size
    self.labelSpacing = labelSpacing
    self.font = font
    self.stroke = stroke
  }
}
