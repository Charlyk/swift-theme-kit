import SwiftUI

/// Defines a typography scale for use across an application, providing visual hierarchy and consistent font styling.
public struct ThemeTypography {
  
  // MARK: - Display
  
  /// Used for large promotional text or hero sections. Bold and eye-catching.
  public let displayLarge: Font
  
  /// Slightly smaller than `displayLarge`, still used for prominent visual titles.
  public let displayMedium: Font
  
  /// Smallest display style, typically used for titles or hero sections in constrained layouts.
  public let displaySmall: Font
  
  // MARK: - Headline
  
  /// Large heading for pages or sections. Typically H1.
  public let headlineLarge: Font
  
  /// Medium heading for sections or nested headers. Typically H2.
  public let headlineMedium: Font
  
  /// Small heading for titles inside cards or components. Typically H3–H4.
  public let headlineSmall: Font
  
  // MARK: - Title
  
  /// Large title used for modals, sheets, or form sections.
  public let titleLarge: Font
  
  /// Medium title for component headers and UI blocks.
  public let titleMedium: Font
  
  /// Small title for inputs, lists, or compact titles.
  public let titleSmall: Font
  
  // MARK: - Label
  
  /// Label for buttons, tabs, or labeled UI elements (e.g. filters).
  public let labelLarge: Font
  
  /// Smaller label text, used for secondary buttons, tags, etc.
  public let labelMedium: Font
  
  /// Very small label for compact UI controls (e.g. chips, input fields).
  public let labelSmall: Font
  
  // MARK: - Body
  
  /// Body text used in paragraphs and long-form content.
  public let bodyLarge: Font
  
  /// Medium body text for standard blocks and list items.
  public let bodyMedium: Font
  
  /// Compact body text for footnotes, cards, and less prominent content.
  public let bodySmall: Font
  
  // MARK: - Button
  
  /// Text used inside buttons or CTA components.
  public let buttonText: Font
  
  /// Default typography scale using Jakarta font family.
  public static let defaultLight = ThemeTypography(
    displayLarge: .system(size: 44, weight: .bold),
    displayMedium: .system(size: 40, weight: .bold),
    displaySmall: .system(size: 32, weight: .bold),
    
    headlineLarge: .system(size: 24, weight: .semibold),
    headlineMedium: .system(size: 20, weight: .semibold),
    headlineSmall: .system(size: 18, weight: .medium),
    
    titleLarge: .system(size: 18, weight: .semibold),
    titleMedium: .system(size: 16, weight: .medium),
    titleSmall: .system(size: 14, weight: .medium),
    
    labelLarge: .system(size: 14, weight: .semibold),
    labelMedium: .system(size: 12, weight: .medium),
    labelSmall: .system(size: 11, weight: .medium),
    
    bodyLarge: .system(size: 18, weight: .regular),
    bodyMedium: .system(size: 16, weight: .regular),
    bodySmall: .system(size: 14, weight: .regular),
    
    buttonText: .system(size: 16, weight: .semibold)
  )
  
  public static let defaultDark = ThemeTypography(
    displayLarge: .system(size: 44, weight: .bold),
    displayMedium: .system(size: 40, weight: .bold),
    displaySmall: .system(size: 32, weight: .bold),
    
    headlineLarge: .system(size: 24, weight: .semibold),
    headlineMedium: .system(size: 20, weight: .semibold),
    headlineSmall: .system(size: 18, weight: .medium),
    
    titleLarge: .system(size: 18, weight: .semibold),
    titleMedium: .system(size: 16, weight: .medium),
    titleSmall: .system(size: 14, weight: .medium),
    
    labelLarge: .system(size: 14, weight: .semibold),
    labelMedium: .system(size: 12, weight: .medium),
    labelSmall: .system(size: 11, weight: .medium),
    
    bodyLarge: .system(size: 18, weight: .regular),
    bodyMedium: .system(size: 16, weight: .regular),
    bodySmall: .system(size: 14, weight: .regular),
    
    buttonText: .system(size: 16, weight: .semibold)
  )
  
  public init(displayLarge: Font,
              displayMedium: Font,
              displaySmall: Font,
              headlineLarge: Font,
              headlineMedium: Font,
              headlineSmall: Font,
              titleLarge: Font,
              titleMedium: Font,
              titleSmall: Font,
              labelLarge: Font,
              labelMedium: Font,
              labelSmall: Font,
              bodyLarge: Font,
              bodyMedium: Font,
              bodySmall: Font,
              buttonText: Font) {
    self.displayLarge = displayLarge
    self.displayMedium = displayMedium
    self.displaySmall = displaySmall
    self.headlineLarge = headlineLarge
    self.headlineMedium = headlineMedium
    self.headlineSmall = headlineSmall
    self.titleLarge = titleLarge
    self.titleMedium = titleMedium
    self.titleSmall = titleSmall
    self.labelLarge = labelLarge
    self.labelMedium = labelMedium
    self.labelSmall = labelSmall
    self.bodyLarge = bodyLarge
    self.bodyMedium = bodyMedium
    self.bodySmall = bodySmall
    self.buttonText = buttonText
  }
  
  subscript(_ token: TextStyleToken) -> Font {
    switch token {
    case .displayLarge: return displayLarge
    case .displayMedium: return displayMedium
    case .displaySmall: return displaySmall
      
    case .headlineLarge: return headlineLarge
    case .headlineMedium: return headlineMedium
    case .headlineSmall: return headlineSmall
      
    case .titleLarge: return titleLarge
    case .titleMedium: return titleMedium
    case .titleSmall: return titleSmall
      
    case .labelLarge: return labelLarge
    case .labelMedium: return labelMedium
    case .labelSmall: return labelSmall
      
    case .bodyLarge: return bodyLarge
    case .bodyMedium: return bodyMedium
    case .bodySmall: return bodySmall
      
    case .buttonText: return buttonText
    }
  }
}

public enum TextStyleToken: String, CaseIterable {
  case displayLarge
  case displayMedium
  case displaySmall
  
  case headlineLarge
  case headlineMedium
  case headlineSmall
  
  case titleLarge
  case titleMedium
  case titleSmall
  
  case labelLarge
  case labelMedium
  case labelSmall
  
  case bodyLarge
  case bodyMedium
  case bodySmall
  
  case buttonText
}

public struct ThemeFontToken {
  public let style: TextStyleToken
  public let weight: Font.Weight?
  
  public init(_ style: TextStyleToken, weight: Font.Weight? = nil) {
    self.style = style
    self.weight = weight
  }
}
