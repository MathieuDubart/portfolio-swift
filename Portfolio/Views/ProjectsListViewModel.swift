//
//  ProjectsListViewModel.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import Foundation

class ProjectsListViewModel: ObservableObject {
    @Published var projects: [Project] = []
    let firestoreController = FirestoreController()
    
    @Published var selectedProject: Project?
    
    init() {}
    
    @MainActor
    func fetchProjects() async {
        let fetchedProjects = await firestoreController.getProjects()
        self.projects = fetchedProjects
    }
}
