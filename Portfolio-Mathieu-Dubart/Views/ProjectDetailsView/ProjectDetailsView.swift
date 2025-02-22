//
//  ProjectDetailsView.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 22/02/2025.
//

import SwiftUI

struct ProjectDetailsView: View {
    var project: Project
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(project.title)
                    .modifier(PortfolioTitle())
                
                Spacer().frame(height: 20)
                
                Text(project.date)
                    .modifier(PortfolioDateCaption())
                
                Spacer()
                    .frame(height:20)
                
                Text(project.description)
                
                Spacer().frame(height: 40)
                
                if project.downloadedPicturesUrl.count > 1 {
                    CarouselView(imagesUrl:project.downloadedPicturesUrl)
                } else {
                    VideoComponent(videoUrl: project.downloadedVideoUrl)
                }
                    
            }
        }
        .padding(12)
    }
}

#Preview {
    ProjectDetailsView(project: Project.example)
}
