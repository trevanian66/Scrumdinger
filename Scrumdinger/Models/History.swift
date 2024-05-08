//
//  History.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 05/05/2024.
//

import Foundation

struct History: Identifiable, Codable {
    
    let id: UUID
    let date: Date
    var attendes: [DailyScrum.Attendee]
    var transcript: String?
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendes = attendees
        self.transcript = transcript
    }
}
