//
//  ProjectCard.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct ProjectCard: View {
    @State var project: Project
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: project.picturesUrl[0])) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 190, height: 300)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
        }
        .background(Color.gray.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        
    }
}

#Preview {
    ProjectCard(project: Project.example)
}
