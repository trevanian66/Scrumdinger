//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 02/05/2024.
//

import SwiftUI

struct MeetingFooterView: View {
   @State var speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted}) else {return nil}
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy({ $0.isCompleted})
    }
    
   private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers"}
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action:skipAction) {
                        Image(systemName:"forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding([.horizontal,.bottom])
    }
}

#Preview (traits: .sizeThatFitsLayout) {
    
    MeetingFooterView(speakers:
            DailyScrum.sampleData[0].attendees.speakers,skipAction: {})
    
    
}
