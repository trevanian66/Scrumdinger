//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 05/05/2024.
//

import SwiftUI

struct EditScrumSheet: View {
    
  
        @Binding var scrum: DailyScrum
        @Binding var isPresentingEditScrumView: Bool
        @State private var editingScrum: DailyScrum = DailyScrum.emptyScrum
    
        var body: some View {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Camcel") {
                                isPresentingEditScrumView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                scrum = editingScrum
                                isPresentingEditScrumView = false
              
                            }
                        }
                        
                        
                    }
                
        
            } .onAppear{ editingScrum = scrum}
        }
    }


#Preview {
    EditScrumSheet(scrum:.constant(DailyScrum.sampleData[0]),isPresentingEditScrumView: .constant(true) )
}
