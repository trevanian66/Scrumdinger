//
//  History.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 05/05/2024.
//

import Foundation

struct History: Identifiable {
    
    let id: UUID
    let date: Date
    var attendes: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendes = attendees
    }
}
