//
//  CheckboxesView.swift
//  SwiftThemeKitDemo
//
//  Created by Albu Eduard on 19.05.2025.
//

import SwiftUI
import SwiftThemeKit

struct CheckboxesView: View {
  @Environment(\.appTheme) private var theme
  @State private var isChecked: Bool = false

  var body: some View {
    Card {
      VStack(alignment: .leading, spacing: theme.spacing.md) {
        Text("Checkboxes")
          .font(.headlineLarge)

        Checkbox(
          isChecked: $isChecked,
          label: "Selected checkbox"
        )
        .fillMaxWidth(alignment: .leading)

        Checkbox(
          isChecked: $isChecked,
          label: "Unselected checkbox"
        )
        .fillMaxWidth(alignment: .leading)

        Checkbox(
          isChecked: $isChecked,
          label: "Leading label checkbox",
          labelPosition: .leading
        )
        .fillMaxWidth(alignment: .leading)

        Checkbox(
          isChecked: $isChecked,
          labelPosition: .leading
        ) {
          HStack {
            Image(systemName: "info.circle")

            Text("Custom label checkbox")
              .font(.titleLarge)
          }
        }
        .fillMaxWidth(alignment: .leading)
      }
      .fillMaxWidth()
    }
  }
}

#Preview {
  CheckboxesView()
    .padding(.md)
}
