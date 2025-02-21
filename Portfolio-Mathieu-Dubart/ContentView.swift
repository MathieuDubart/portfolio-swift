//
//  ContentView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @StateObject private var viewModel = ProjectsListViewModel()
    @State private var navigateToProject: Project? = nil
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack(alignment: .leading) {
                Text("Portfolio.")
                    .modifier(PortfolioLargeTitle())
                GridView()
                    .environmentObject(viewModel)
                    .onAppear {
                        Task {
                            await viewModel.fetchProjects()
                            viewModel.projects.forEach { print("Project id: \($0.id)") }
                        }
                        
                    }
                    .navigationDestination(for: Project.self) { project in
                        if let videoUrl = project.downloadedVideoUrl {
                            SingleVideoPlayer(videoURL: videoUrl, controller: VideoPlayerController())
                                .frame(height: 300)
                                .cornerRadius(10)
                        } else {
                            Text("Chargement de la vidéo...")
                                .foregroundColor(.gray)
                        }
                    }
            }
            .navigationDestination(for: Project.self) { project in
                Text(project.title)
            }
            .padding(.horizontal, 12)
        }
        .sheet(item: $viewModel.selectedProject) { project in
            ProjectSheetView(project: project)
                .environmentObject(viewModel)
                .presentationDetents([.medium, .fraction(0.5)])
                .presentationDragIndicator(.visible)
        }
        .onChange(of: navigateToProject) { _, newProject in
            if newProject != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    viewModel.selectedProject = nil // Ferme la Sheet proprement
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
