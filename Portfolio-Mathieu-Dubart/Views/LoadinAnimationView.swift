//
//  LoadinAnimationView.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 01/03/2025.
//

import SwiftUI

struct LoadingAnimationView: View {
    let messages: [String] = [
        "Welcome!",
        "I'm Mathieu",
        "And this is my portfolio",
        "Take a look at my work!",
        "😉",
        "ProgressView"
    ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            if messages[currentIndex] != "ProgressView" {
                Text(messages[currentIndex])
                    .modifier(PortfolioDateCaption())
                    .transition(.opacity)
                    .id(currentIndex)
            } else {
                ProgressView()
            }
            
        }
        .onAppear {
            cycleMessages()
        }
    }
    
    /// Fait défiler les messages l'un après l'autre
    private func cycleMessages() {
        let displayDuration = 5.0
        
        for i in 1..<messages.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + displayDuration * Double(i)) {
                withAnimation {
                    currentIndex = i
                }
            }
        }
    }
}

struct LoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimationView()
    }
}
