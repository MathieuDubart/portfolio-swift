//
//  ContentView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProjectsListViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            if viewModel.entitiesAreLoaded {
                TabView {
                    Tab("Projects", systemImage: "hammer") {
                        HomeView()
                            .environmentObject(viewModel)
                    }
                    
                    Tab("About me", systemImage: "person.fill") {
                        AboutMeView()
                    }
                }
            } else {
                VStack {
                    Image(colorScheme == .light ? "logo_day" : "logo_night")
                        .modifier(PortfolioLargeTitle())
                    
                    LoadingAnimationView()
                }
                .onAppear {
                    Task {
                        await viewModel.fetchProjects()
                        viewModel.projects.forEach { print("Project id: \($0.id)") }
                    }
                    
                }
            }
        }
        .animation(.easeInOut, value: viewModel.entitiesAreLoaded)
    }
}

#Preview {
    ContentView()
}
