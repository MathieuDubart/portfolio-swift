//
//  VideoPlayerController.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 21/02/2025.
//

import AVKit
import Foundation

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
