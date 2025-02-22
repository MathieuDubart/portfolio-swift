//
//  VideoComponent.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 22/02/2025.
//

import SwiftUI

struct VideoComponent: View {
    var videoUrl: URL?
    
    var body: some View {
        if let videoUrl {
            SingleVideoPlayer(videoURL: videoUrl, controller: VideoPlayerController())
                .frame(height: 300)
                .cornerRadius(10)
        } else {
            Text("Video URL is not a valid URL.")
        }
    }
}

#Preview {
    VideoComponent(videoUrl: URL(string: "test")!)
}
