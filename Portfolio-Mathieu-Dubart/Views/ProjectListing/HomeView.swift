//
//  HomeView.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 22/02/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: ProjectsListViewModel
    @State private var navigateToProject: Project? = nil
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack(alignment: .leading) {
                Text("Portfolio")
                    .modifier(PortfolioLargeTitle())
                GridView()
                    .navigationDestination(for: Project.self) { project in
                        ProjectDetailsView(project: project)
                    }
            }
            .navigationDestination(for: Project.self) { project in
                Text(project.title)
            }
            .padding(.horizontal, 12)
        }
        .sheet(item: $viewModel.selectedProject) { project in
            ProjectSheetView(project: project)
                .presentationDetents([.medium, .fraction(0.5)])
                .presentationDragIndicator(.visible)
        }
        .onChange(of: navigateToProject) { _, newProject in
            if newProject != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    viewModel.selectedProject = nil
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
