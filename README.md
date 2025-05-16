# SwiftThemeKit - A Modern Design System Framework for SwiftUI

SwiftThemeKit is a powerful and flexible design system framework for SwiftUI that enables you to create consistent, themeable user interfaces with ease. It provides a comprehensive set of components and utilities that follow modern design principles while maintaining full customizability.

## Features

- 🎨 Complete theming system with support for light and dark modes

- 📱 Ready-to-use UI components following design system best practices
- 🔧 Highly customizable tokens for colors, typography, spacing, and more
- ♿️ Built with accessibility in mind
- 📦 Easy to integrate and use in SwiftUI projects

## Installation

Add SwiftThemeKit to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/Charlyk/swift-theme-kit.git", from: "1.0.0")
]
```

## Quick Start

1. Wrap your root view with ThemeProvider:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ThemeProvider {
                ContentView()
            }
        }
    }
}
```

1. Use themed components in your views:

```swift
struct ContentView: View {
    @State private var isEnabled = false

    var body: some View {
        VStack {
            Button("Primary Button") {
                // Action
            }
            .applyThemeButtonStyle()

            Checkbox(isChecked: $isEnabled, label: "Enable Feature")

            TextField("Username", text: $username)
                .applyThemeTextFieldStyle()
        }
    }
}
```

## Core Components

### Buttons

SwiftThemeKit provides various button styles and variants:

- Filled
- Tonal
- Outlined
- Elevated
- Text

### Form Controls

Ready-to-use form components:

- Checkbox with customizable shapes and labels
- Radio buttons and radio groups
- Text fields with multiple variants (outlined, filled, underlined)

### Cards

Flexible card components with support for:

- Custom padding and elevation
- Background color customization
- Shadow configuration

## Theming System

SwiftThemeKit uses a token-based approach for consistent styling:

### Color Tokens

- Primary and secondary colors with variants
- Surface colors for different elevations
- State colors (error, success, etc.)
- On-color variants for proper contrast

### Typography Scale

- Display styles (large, medium, small)
- Headline styles
- Body text styles
- Label and button text styles

### Spacing and Shape

- Consistent spacing scale (xs to xxl)
- Corner radius tokens
- Shadow elevation system

## Customization

Create custom themes by extending the default configuration:

```swift
let customTheme = Theme(
    colors: .customColors,
    typography: .customTypography,
    spacing: .customSpacing,
    // ... other configurations
)
```

## Best Practices

- Use the provided environment values for consistent theming
- Leverage the modifier system for component customization
- Follow the token-based approach for maintaining consistency
- Use semantic color tokens instead of direct color values

## Documentation

See the full documentation [here](https://charlyk.github.io/swift-theme-kit/)

## Requirements

- iOS 14.0+
- macOS 11.0+
- tvOS 15.0+
- watchOS 7.0+
- Swift 5.5+

## Contributing

We welcome contributions! Please read our contributing guidelines before submitting pull requests.

## License

SwiftThemeKit is available under the MIT license. See the [LICENSE file](https://github.com/Charlyk/swift-theme-kit/blob/master/LICENCE) for more info.

## Keywords

swift, swiftui, design-system, theme, ui-components, ios, macos, tvos, watchos, dark-mode, accessibility, design-tokens, styling, ui-framework, swift-package
