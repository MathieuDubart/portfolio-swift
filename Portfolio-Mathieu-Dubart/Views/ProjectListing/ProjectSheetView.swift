//
//  ProjectSheetView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct ProjectSheetView: View {
    let project: Project
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ProjectsListViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(project.title.uppercased())
                    .modifier(PortfolioTitle())
                
                
                Text(project.date)
                    .foregroundColor(.secondary)
                    .modifier(PortfolioDateCaption())
                
                Spacer()
                    .frame(height: 20)
                
                Text(project.intro)
                    .lineLimit(3)
                    .padding([.trailing], 18)
                
                Spacer()
                    .frame(height: 20)
                
                Button {
                    dismiss() // Ferme la Sheet
                    viewModel.goToProject(project)
                } label: {
                    HStack {
                        Text("View project")
                        Image(systemName: "arrow.right")
                    }
                }
                .buttonStyle(PortfolioButton())
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .padding([.horizontal], 12)
        }
    }
}

#Preview {
    ProjectSheetView(project: Project.example)
}
