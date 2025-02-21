//
//  SingleVideoPlayer.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 21/02/2025.
//

import SwiftUI
import AVKit

// MARK: - SwiftUI Views

struct SingleVideoPlayer: View {
    var videoURL: URL
    @ObservedObject var controller: VideoPlayerController
    
    var body: some View {
        ZStack {
            // Passage du frameSize avec la taille de l'écran
            VideoPlayerRepresentable(
                videoURL: videoURL,
                frameSize: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height),
                controller: controller
            )
            
            // Affichage d'un indicateur de chargement si nécessaire
            if controller.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            }
        }
    }
    
    // Exposition de méthodes pratiques
    func play() {
        controller.play()
    }
    
    func pause() {
        controller.pause()
    }
}
