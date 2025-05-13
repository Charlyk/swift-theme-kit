//
//  AppThemeKey.swift
//  SwiftThemeKit
//
//  Created by Albu Eduard on 13.05.2025.
//


import SwiftUI

private struct AppThemeKey: EnvironmentKey {
    static let defaultValue = Theme.defaultLight // Your default theme instance
}

extension EnvironmentValues {
    public var appTheme: Theme {
        get { self[AppThemeKey.self] }
        set { self[AppThemeKey.self] = newValue }
    }
}
