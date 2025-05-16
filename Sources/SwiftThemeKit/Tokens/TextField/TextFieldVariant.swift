import SwiftUI

/// Defines the visual style or variant of a text field.
///
/// Use `TextFieldVariant` to control how a text field appears in your UI.
/// Each variant corresponds to a specific Material-style or native iOS presentation.
///
/// This enum is typically consumed by `ThemeTextFieldStyle` or applied via
/// modifiers like `.textFieldVariant()` to customize text field appearance.
///
/// - Usage:
///   ```swift
///   TextField("Email", text: $email)
///     .textFieldVariant(.outlined)
///   ```
public enum TextFieldVariant {

  /// An outlined text field with a border around its shape.
  ///
  /// - Example: `┌────────────┐`
  ///            `| Email      |`
  ///            `└────────────┘`
  case outlined

  /// A text field with an underline rather than a full border.
  ///
  /// - Example: `Email`
  ///            `────────────`
  case underlined

  /// A filled text field with a background color and no border.
  ///
  /// - Example: `[ Email        ]` with background fill.
  case filled

  /// A plain text field without additional styling.
  ///
  /// Useful when embedding in custom layouts or when minimal styling is desired.
  case plain
}
