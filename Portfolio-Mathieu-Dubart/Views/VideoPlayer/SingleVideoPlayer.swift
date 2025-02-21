//
//  SingleVideoPlayer.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 21/02/2025.
//

import SwiftUI
import AVKit

// MARK: - VideoPlayerController

class VideoPlayerController: ObservableObject {
    private weak var playerViewController: PlayerViewController?
    
    // Indicateur de chargement de la vidéo
    @Published var isLoading: Bool = false
    
    var onVideoEnd: (() -> Void)?
    
    func setPlayerViewController(_ controller: PlayerViewController) {
        self.playerViewController = controller
        // Ajout de l'observateur pour la fin de la vidéo
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(videoDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
            object: nil
        )
    }
    
    // Mise à jour de la vidéo en passant également la taille d'affichage
    func updateVideo(_ videoURL: URL, frameSize: CGSize) {
        isLoading = true
        playerViewController?.updateVideoSource(videoURL: videoURL, frameSize: frameSize)
        isLoading = false
    }
    
    // Démarrer la lecture
    func play() {
        playerViewController?.player?.play()
    }
    
    // Mettre en pause
    func pause() {
        playerViewController?.player?.pause()
    }
    
    @objc private func videoDidFinishPlaying(notification: Notification) {
        DispatchQueue.main.async {
            self.onVideoEnd?()
        }
    }
}

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

struct VideoPlayerRepresentable: UIViewControllerRepresentable {
    var videoURL: URL
    var frameSize: CGSize
    var controller: VideoPlayerController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = PlayerViewController(videoURL: videoURL, frameSize: frameSize)
        controller.setPlayerViewController(vc)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let playerVC = uiViewController as? PlayerViewController {
            playerVC.updateVideoSource(videoURL: videoURL, frameSize: frameSize)
        }
    }
}
