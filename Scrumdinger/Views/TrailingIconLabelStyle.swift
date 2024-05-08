//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 14/04/2024.
//


import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            
            configuration.title
            configuration.icon
            
        }
    }
    
    
    
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    
    static var trailingIcon: Self {Self()}
}
