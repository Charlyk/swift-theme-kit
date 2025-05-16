import SwiftUI

public struct Card<Content: View>: View {
  @Environment(\.appTheme) var theme
  private let content: () -> Content
  var padding: EdgeInsets?
  var backgroundColor: Color?
  var elevation: ShadowToken

  public init(
    elevation: ShadowToken = .md,
    padding: EdgeInsets? = nil,
    backgroundColor: Color? = nil,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.content = content
    self.padding = padding
    self.backgroundColor = backgroundColor
    self.elevation = elevation
  }

  public var body: some View {
    let contentPadding = padding ?? EdgeInsets(
      top: theme.spacing.md,
      leading: theme.spacing.md,
      bottom: theme.spacing.md,
      trailing: theme.spacing.md
    )

    let bgColor = backgroundColor ?? theme.colors.surfaceVariant

    content()
      .padding(contentPadding)
      .background(
        theme.shapes.md
          .fill(bgColor)
      )
      .clipShape(.md)
      .shadow(elevation)
  }
}
