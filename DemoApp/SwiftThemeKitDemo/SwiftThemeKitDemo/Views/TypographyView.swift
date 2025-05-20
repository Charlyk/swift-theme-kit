//
//  TypographyView.swift
//  SwiftThemeKitDemo
//
//  Created by Albu Eduard on 19.05.2025.
//

import SwiftUI
import SwiftThemeKit

struct TypographyView: View {
  @Environment(\.appTheme) private var theme

  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Typography")
          .font(.headlineLarge)

        ForEach(TextStyleToken.allCases, id: \.rawValue) {
          Text($0.rawValue)
            .font($0)
        }
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  TypographyView()
    .padding(.md)
}
