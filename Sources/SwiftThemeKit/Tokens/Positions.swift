import Foundation

/// Represents horizontal alignment or placement direction.
///
/// Used to position UI elements such as labels relative to controls (e.g., leading or trailing side of a checkbox or radio button).
///
/// - Example:
///   ```swift
///   Checkbox(isChecked: $checked, label: "Accept Terms", labelPosition: .leading)
///   ```
public enum HorizontalPosition {
  /// Leading edge (left in left-to-right layouts).
  case leading

  /// Trailing edge (right in left-to-right layouts).
  case trailing
}

/// Represents vertical alignment or placement direction.
///
/// Useful for positioning content relative to other components, such as placing a message above or below a form field.
///
/// - Example:
///   ```swift
///   Tooltip(position: .top)
///   ```
public enum VerticalPosition {
  /// Top edge — places the content above the reference view.
  case top

  /// Bottom edge — places the content below the reference view.
  case bottom
}
