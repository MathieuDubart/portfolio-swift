//
//  ProjectsListViewModel.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

class ProjectsListViewModel: ObservableObject {
    @Published var projects: [Project] = []
    let firestoreController = FirestoreController()
    
    @Published var selectedProject: Project?
    @Published var navigationPath = NavigationPath()
    
    @Published var entitiesAreLoaded = false
    @Published var welcomeText = "Welcome!"
    
    init() {}
    
    @MainActor
    func fetchProjects() async {
        var fetchedProjects = await firestoreController.getProjects()
        
        for projectIndex in fetchedProjects.indices {
            let project = fetchedProjects[projectIndex]
            
            var imageUrls: [URL?] = []
            for path in project.picturesUrl {
                if let url = await firestoreController.getDownloadURL(for: path) {
                    imageUrls.append(url)
                } else {
                    imageUrls.append(nil)
                }
            }
            
            var videoUrl: URL? = nil
            if let videoPath = project.videoUrl {
                videoUrl = await firestoreController.getDownloadURL(for: videoPath)
            }
            
            fetchedProjects[projectIndex].downloadedPicturesUrl = imageUrls
            fetchedProjects[projectIndex].downloadedVideoUrl = videoUrl
        }
        
        self.projects = fetchedProjects
        entitiesAreLoaded = true
    }
    
    func goToProject(_ project: Project) {
        DispatchQueue.main.async {
            self.selectedProject = nil
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.navigationPath.append(project)
            }
        }
    }
}
