//
//  ProjectSheetView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct ProjectSheetView: View {
    let project: Project
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: project.picturesUrl[0])) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 190, height: 300)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            
            Text(project.title)
            Text(project.date)
            Text(project.description)
            
            Button {} label: {
                HStack {
                    Text("View project")
                    Image(systemName: "arrow.right")
                }
            }
        }
    }
}

#Preview {
    ProjectSheetView(project: Project.example)
}
