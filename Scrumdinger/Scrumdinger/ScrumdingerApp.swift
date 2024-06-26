//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 10/04/2024.
//

import SwiftUI

@main

struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
