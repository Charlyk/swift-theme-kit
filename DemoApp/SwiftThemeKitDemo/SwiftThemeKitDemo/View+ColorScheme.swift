import SwiftUI

extension View {
  /// Adds a toolbar button to toggle the app's color scheme between light and dark modes.
  ///
  /// - Parameter colorScheme: A binding to the current `AppColorScheme` value.
  /// - Returns: A view with a toolbar button placed appropriately depending on the platform.
  func colorSchemeButton(colorScheme: Binding<AppColorScheme>) -> some View {
    #if os(iOS)
    let placement: ToolbarItemPlacement = .topBarTrailing
    #elseif os(macOS)
    // `.automatic` is typically appropriate for macOS toolbars.
    let placement: ToolbarItemPlacement = .automatic
    #else
    let placement: ToolbarItemPlacement = .automatic
    #endif

    return self.toolbar {
      ToolbarItem(placement: placement) {
        Button {
          // Toggle between light and dark modes.
          colorScheme.wrappedValue = (colorScheme.wrappedValue == .light) ? .dark : .light
        } label: {
          // Show icon depending on current color scheme.
          Image(systemName: colorScheme.wrappedValue == .light ? "moon" : "sun.max")
        }
      }
    }
  }
}
