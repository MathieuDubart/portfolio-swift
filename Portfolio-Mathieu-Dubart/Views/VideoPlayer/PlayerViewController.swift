//
//  PlayerViewController.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 21/02/2025.
//
import AVKit
import SwiftUI

// MARK: - PlayerViewController

class PlayerViewController: AVPlayerViewController {
    
    // Initialisateur incluant la taille du cadre
    init(videoURL: URL, frameSize: CGSize) {
        super.init(nibName: nil, bundle: nil)
        // Définir le cadre de la vue
        self.view.frame = CGRect(origin: .zero, size: frameSize)
        self.player = AVPlayer(url: videoURL)
        self.showsPlaybackControls = true
        // Lancer la lecture dès le chargement (optionnel)
        self.player?.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) n'est pas implémenté")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // Forcer l'affichage en mode portrait
        return .portrait
    }
    
    // Mise à jour de la source vidéo et du cadre
    func updateVideoSource(videoURL: URL, frameSize: CGSize) {
        self.view.frame = CGRect(origin: .zero, size: frameSize)
        self.player = AVPlayer(url: videoURL)
        self.player?.play()
    }
}
