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
                        Text("About Me")
                    }
                }
            } else {
                VStack {
                    Image(colorScheme == .light ? "logo_day" : "logo_night")
                        .modifier(PortfolioLargeTitle())
                    
                    Text(viewModel.welcomeText)
                        .modifier(PortfolioLargeTitle())
                        .animation(.easeInOut, value: viewModel.welcomeText)
                        .task {
                            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                                viewModel.welcomeText = "Loading..."
                            }
                        }
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
