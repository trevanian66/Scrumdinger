//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 15/04/2024.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewwScrumView = false
    let saveAction: () ->Void
    
    var body: some View {
        
        NavigationStack {
            
            List($scrums) { $scrum in
                NavigationLink(destination:  DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                } 
                .listRowBackground(scrum.theme.mainColor)
                
                
            } 
              .navigationTitle("Daily Scrums")
              .toolbar {
                  Button(action: {isPresentingNewwScrumView = true}) {
                      Image(systemName: "plus")
                         
                  }
                  .accessibilityLabel("New scrum")     
              }
              .sheet(isPresented: $isPresentingNewwScrumView) {
                  NewScrumSheet(isPresentingNewScrumView: $isPresentingNewwScrumView, scrums: $scrums )
                  
              }
              .onChange(of: scenePhase) { oldPhase,newPhase in
                if newPhase == .inactive { saveAction()}
              }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData),saveAction: {})
}
