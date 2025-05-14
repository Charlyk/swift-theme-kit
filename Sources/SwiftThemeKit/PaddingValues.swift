import Foundation

public struct PaddingValues {
    let top: CGFloat
    let leading: CGFloat
    let bottom: CGFloat
    let trailing: CGFloat

    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }

    public init(all: CGFloat) {
        self.top = all
        self.leading = all
        self.bottom = all
        self.trailing = all
    }

    public init(horizontal: CGFloat) {
        self.top = .zero
        self.leading = horizontal
        self.bottom = .zero
        self.trailing = horizontal
    }

    public init(vertical: CGFloat) {
        self.top = vertical
        self.leading = .zero
        self.bottom = vertical
        self.trailing = .zero
    }

    public init(horizontal: CGFloat, vertical: CGFloat) {
        self.top = vertical
        self.leading = horizontal
        self.bottom = vertical
        self.trailing = horizontal
    }
}
