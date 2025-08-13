import SwiftUI

#if os(macOS)
import AppKit
typealias PlatformColor = NSColor
#else
import UIKit
typealias PlatformColor = UIColor
#endif

#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
@inline(__always)
private func rgba(_ color: UIColor) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)? {
  // Resolve dynamic colors against the current trait collection
  let resolved = color.resolvedColor(with: UIScreen.main.traitCollection)
  var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
  guard resolved.getRed(&r, green: &g, blue: &b, alpha: &a) else { return nil }
  return (r, g, b, a)
}
#elseif os(macOS)
@inline(__always)
private func rgba(_ color: NSColor,
                  appearance: NSAppearance? = NSApp?.effectiveAppearance)
-> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)? {

  // Convert to an RGB-compatible color space (works once correct appearance is current)
  let convertToRGB = { () -> NSColor? in
    color.usingColorSpace(NSColorSpace.sRGB) ?? color.usingColorSpace(NSColorSpace.deviceRGB)
  }

  // If we have an appearance, make it current while converting (resolves dynamic/catalog colors)
  let rgb: NSColor?
  if let ap = appearance {
    var tmp: NSColor?
    ap.performAsCurrentDrawingAppearance {
      tmp = convertToRGB()
    }
    rgb = tmp
  } else {
    rgb = convertToRGB()
  }

  guard let rgb else { return nil }

  var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
  rgb.getRed(&r, green: &g, blue: &b, alpha: &a)   // no Bool return on macOS
  return (r, g, b, a)
}
#endif


extension Color {
  /// Initializes a `Color` from a hex string like `"#FF0000"` or `"FF0000"`
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }

    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue:  Double(b) / 255,
      opacity: Double(a) / 255
    )
  }

  /// Returns a darker version of the color by reducing brightness.
  /// - Parameter amount: A value between 0 and 1. `0.1` means 10% darker.
  func darken(by amount: CGFloat) -> Color {
#if canImport(UIKit)
    let uiColor = UIColor(self)
    var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0

    if uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
      let newBrightness = max(brightness - amount, 0.0)
      return Color(hue: hue, saturation: saturation, brightness: newBrightness)
    }

    return self // fallback

#elseif canImport(AppKit)
    if let nsColor = NSColor(self).usingColorSpace(.deviceRGB) {
      var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
      nsColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

      let newBrightness = max(brightness - amount, 0.0)
      return Color(hue: hue, saturation: saturation, brightness: newBrightness)
    }

    return self // fallback

#else
    return self
#endif
  }

  /// Returns a lighter version of the color by increasing brightness.
  /// - Parameter amount: A value between 0 and 1. `0.1` means 10% lighter.
  func lighten(by amount: CGFloat) -> Color {
#if canImport(UIKit)
    let uiColor = UIColor(self)
    var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0

    if uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
      let newBrightness = min(brightness + amount, 1.0)
      return Color(hue: hue, saturation: saturation, brightness: newBrightness)
    }

    return self // fallback

#elseif canImport(AppKit)
    if let nsColor = NSColor(self).usingColorSpace(.deviceRGB) {
      var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
      nsColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

      let newBrightness = min(brightness + amount, 1.0)
      return Color(hue: hue, saturation: saturation, brightness: newBrightness)
    }

    return self // fallback

#else
    return self
#endif
  }

  /// Blends this color with another using alpha compositing (A over B).
  /// Works on iOS, macOS, watchOS, and visionOS.
  func blend(with overlay: Color, alpha: Double) -> Color {
    let base = PlatformColor(self)
    let top = PlatformColor(overlay.opacity(alpha))

    var br: CGFloat = 0, bg: CGFloat = 0, bb: CGFloat = 0, ba: CGFloat = 0
    var tr: CGFloat = 0, tg: CGFloat = 0, tb: CGFloat = 0, ta: CGFloat = 0

#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
    guard let b = rgba(base), let t = rgba(top) else { return self }
#else
    guard let b = rgba(base), let t = rgba(top) else { return self }
#endif

    let r = t.r * CGFloat(alpha) + b.r * (1 - CGFloat(alpha))
    let g = t.g * CGFloat(alpha) + b.g * (1 - CGFloat(alpha))
    let bl = t.b * CGFloat(alpha) + b.b * (1 - CGFloat(alpha))

    return Color(red: Double(r), green: Double(g), blue: Double(bl))
  }
}
