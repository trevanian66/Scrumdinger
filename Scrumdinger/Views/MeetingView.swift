//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 10/04/2024.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    @State private var speechRecognizer = SpeechRecognizer()
    @State private var isRecording: Bool = false
     
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
           
            VStack {
                
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                
                MeetingTimerView(theme: scrum.theme, speakers: scrumTimer.speakers, isRecording: isRecording)
 
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
           
         
            }
        } 
        .padding()
        .foregroundColor(scrum.theme.accentColor)

        .onAppear {
            startScrum()
            
        }
        .onDisappear {
            endScrum()
        }
        .navigationBarTitleDisplayMode( .inline)
    }
    
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)

        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        isRecording = true
        scrumTimer.startScrum()
        
    }
    
    private func endScrum() {
        
        scrumTimer.stopScrum()
        speechRecognizer.stopTranscribing()
        isRecording = false
        let newHistory = History(attendees: scrum.attendees, transcript: speechRecognizer.transcript)
        scrum.history.insert(newHistory, at: 0)
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
        }
