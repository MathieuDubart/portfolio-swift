//
//  VideoPlayerRepresentable.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 21/02/2025.
//

import SwiftUI
import Foundation

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
