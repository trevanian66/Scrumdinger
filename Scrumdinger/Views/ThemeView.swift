//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 24/04/2024.
//

import SwiftUI

struct ThemeView: View {
    
    let theme: Theme
    
    var body: some View {
        Text(theme.rawValue)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
          
        
    }
}

#Preview {
    ThemeView(theme: .yellow)
}

