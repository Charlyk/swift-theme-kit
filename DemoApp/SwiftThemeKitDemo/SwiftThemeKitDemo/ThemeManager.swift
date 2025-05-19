import SwiftUI

enum AppColorScheme: String {
  case system, light, dark
}

final class ThemeManager: ObservableObject {
  @AppStorage("colorScheme") private var storedScheme: String = AppColorScheme.system.rawValue {
    didSet { objectWillChange.send() }
  }

  var scheme: AppColorScheme {
    get { AppColorScheme(rawValue: storedScheme) ?? .system }
    set { storedScheme = newValue.rawValue }
  }
}
