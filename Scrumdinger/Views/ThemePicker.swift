//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 24/04/2024.
//

import SwiftUI

struct ThemePicker: View {
    
    @Binding var selection: Theme
    
    var body: some View {

        
        Picker("Theme",selection: $selection) {
            ForEach(Theme.allCases) {theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {

    ThemePicker(selection: .constant(.bubblegum))
}
