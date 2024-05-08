//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 16/04/2024.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var scrum: DailyScrum
    @State private var isPresentingEditScrumView: Bool = false
    
    var body: some View {
        
        List {
            
            Section(header: Text("Meeting Info")) {
            }
            NavigationLink(destination:  MeetingView(scrum: $scrum)) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
            HStack {
                Label("Length",systemImage: "clock")
                Spacer()
                Text("\(scrum.lengthInMinutes) minutes")
                
            }
            .accessibilityElement(children: .combine)
            
            HStack {
                
                Label("Theme",systemImage: "paintpalette")
                Spacer()
                Text(scrum.theme.name)
                    .padding(4)
                    .foregroundColor(scrum.theme.accentColor)
                    .background(scrum.theme.mainColor)
                    .cornerRadius(4)
            }
            .accessibilityElement(children: .combine)
            
            Section(header: Text("Attendees")) {
               ForEach(scrum.attendees) { attendee in                   
                    Label(attendee.name,systemImage: "person")
                }
            }
            
            Section(header: Text("History")) {
                if (scrum.history.isEmpty)
                {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                
                ForEach(scrum.history) { history in
                    NavigationLink(destination:  HistoryView(history: history)) {
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                    
                }
            
            }
            
 
        } .navigationTitle(scrum.title)
            .toolbar {
                Button("Edit") {
                    isPresentingEditScrumView = true
                }
            }
            .sheet(isPresented: $isPresentingEditScrumView) {
                EditScrumSheet(scrum: $scrum, isPresentingEditScrumView: $isPresentingEditScrumView)
            }
 
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
