//
//  View+ColorScheme.swift
//  SwiftThemeKitDemo
//
//  Created by Eduard Albu on 18.05.2025.
//

import SwiftUI

extension View {
  func colorSchemeButton(colorScheme: Binding<AppColorScheme>) -> some View {
    self.toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button {
          if colorScheme.wrappedValue == .light {
            colorScheme.wrappedValue = .dark
          } else {
            colorScheme.wrappedValue = .light
          }
        } label: {
          if colorScheme.wrappedValue == .light {
            Image(systemName: "moon")
          } else {
            Image(systemName: "sun.max")
          }
        }
      }
    }
  }
}
