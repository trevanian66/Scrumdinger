//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Kobby Awadzi on 06/05/2024.
//

import SwiftUI

struct ErrorView: View {
    
    let errorWarpper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWarpper.error.localizedDescription)
                    .font(.headline)
                Text(errorWarpper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
        .cornerRadius(16)
        .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
                 
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error.")
    }
    static var previews: some View {
        ErrorView(errorWarpper: wrapper
        )
    }
}
