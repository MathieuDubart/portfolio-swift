//
//  ProjectCard.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct ProjectCard: View {
    @State var project: Project
    @EnvironmentObject var viewModel: ProjectsListViewModel
    
    @State private var downloadURL: URL?
    
    var body: some View {
        ZStack {
            if let firstImageURL = project.downloadedPicturesUrl.first {
                AsyncImage(url: firstImageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170, height: 270)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: 170, height: 270)
                }
            } else {
                Color.gray.opacity(0.3)
                    .frame(width: 170, height: 270)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
        }
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .onTapGesture { _ in
            viewModel.selectedProject = project
        }
    }
}

#Preview {
    ProjectCard(project: Project.example)
}
