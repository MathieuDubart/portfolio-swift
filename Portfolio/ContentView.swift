//
//  ContentView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProjectsListViewModel()
    private let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.projects) { project in
                        ProjectCard(project: project)
                            .onTapGesture { _ in
                                viewModel.selectedProject = project
                                viewModel.showProjectDetails.toggle()
                            }
                    }
                }
                .padding([.horizontal, .bottom])
                .padding()
                .navigationTitle("Portfolio")
                .onAppear {
                    Task { await viewModel.fetchProjects() }
                }
                .sheet(item: $viewModel.selectedProject) { project in
                    ProjectSheetView(project: project)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
