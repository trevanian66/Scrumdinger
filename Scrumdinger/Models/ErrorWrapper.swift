//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 06/05/2024.
//

import Foundation

struct ErrorWrapper: Identifiable {
    
    let id: UUID
    var error: Error
    var guidance: String
    
    init (id: UUID = UUID(), error: Error, guidance: String) {
        
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
