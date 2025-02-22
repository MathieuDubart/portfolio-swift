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
                        AboutMeView()
                    }
                }
            } else {
                VStack {
                    Image(colorScheme == .light ? "logo_day" : "logo_night")
                        .modifier(PortfolioLargeTitle())
                    
                    Text("Welcome!")
                        .modifier(PortfolioLargeTitle())
                    
                    Text("Loading...")
                        .modifier(PortfolioDateCaption())
                        .opacity(viewModel.loadingOpacity)
                        .animation(.easeInOut, value: viewModel.loadingOpacity)
                        .task {
                            DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                                viewModel.loadingOpacity = 1
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
