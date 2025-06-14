import SwiftUI

/// A flexible, reusable card component that adapts to the current theme.
///
/// The `Card` view provides a styled container with rounded corners, background color,
/// shadow elevation, and optional padding. It is ideal for grouping related content in a visually distinct block.
///
/// Example usage:
/// ```swift
/// Card {
///   Text("Profile details")
/// }
/// ```
///
/// The card uses the current `Theme` from the environment to style its appearance.
public struct Card<Content: View>: View {
  @Environment(\.appTheme) var theme

  private let content: () -> Content
  var padding: EdgeInsets?
  var backgroundColor: Color?
  var elevation: ShadowToken

  /// Creates a new themed `Card` container.
  ///
  /// - Parameters:
  ///   - elevation: The shadow elevation applied to the card. Defaults to `.md`.
  ///   - padding: Optional custom padding for the card’s content. If `nil`, uses default theme spacing.
  ///   - backgroundColor: Optional override for the card's background color. Defaults to `theme.colors.surfaceContainerHigh`.
  ///   - content: A view builder closure containing the card's inner content.
  public init(
    elevation: ShadowToken = .sm,
    padding: EdgeInsets? = nil,
    backgroundColor: Color? = nil,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.content = content
    self.padding = padding
    self.backgroundColor = backgroundColor
    self.elevation = elevation
  }

  /// The visual representation of the card, composed of the content and its styling.
  ///
  /// The body applies the current theme’s spacing, shape, and shadow, and clips the view
  /// using a medium corner radius defined by the theme.
  public var body: some View {
    let contentPadding = padding ?? EdgeInsets(
      top: theme.spacing.md,
      leading: theme.spacing.md,
      bottom: theme.spacing.md,
      trailing: theme.spacing.md
    )

    let bgColor = backgroundColor ?? theme.colors.surfaceContainerHigh

    content()
      .padding(contentPadding)
      .background(
        theme.shapes[.md]
          .fill(bgColor)
      )
      .clipShape(.md)
      .shadow(elevation)
  }
}

#Preview {
  VStack {
    Card {
      Text("Hello, World!")
        .frame(maxWidth: .infinity)
    }
  }
  .padding(.horizontal, 16)
}
