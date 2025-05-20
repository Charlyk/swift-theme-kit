import SwiftUI

public struct RadioButtonConfiguration: Equatable {

  /// The width and height of the radio button box (circle) in points.
  ///
  /// This controls the size of the tappable/selectable region.
  public let size: CGFloat

  /// The horizontal spacing between the radio button circle box and its label.
  ///
  /// This is typically defined by a `SpacingToken` like `.sm`, `.md`, etc.,
  /// to keep spacing consistent across the system.
  public let labelSpacing: SpacingToken

  /// The typography token used for the radio button label.
  ///
  /// This defines the font size, weight, and line height for the associated label text.
  public let font: TextStyleToken

  /// The stroke thickness applied to the radio button border.
  ///
  /// This is defined using a `StrokeToken` and varies depending on size and platform.
  public let stroke: StrokeToken

  /// Creates a new `CheckboxConfiguration` with the specified size, spacing, font, and stroke.
  ///
  /// - Parameters:
  ///   - size: The square size of the radio button in points.
  ///   - labelSpacing: The spacing between radio button and label.
  ///   - font: The typography token used for the radio button label.
  ///   - stroke: The stroke thickness applied to the radio button border.
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
