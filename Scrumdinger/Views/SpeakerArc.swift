//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 07/05/2024.
//

import SwiftUI

struct SpeakerArc : Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degressPerSpeaker: Double {
        360.00 / Double(totalSpeakers)
    }
    
    private var startAngle: Angle {
        Angle(degrees: degressPerSpeaker * Double(speakerIndex) + 1.0)
    }
    
    private var endtAngle: Angle {
        Angle(degrees: startAngle.degrees + degressPerSpeaker - 1.0)
    }
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endtAngle, clockwise: false)
        }
    }
}
