//
//  ContentView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProjectsListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Portfolio.")
                    .modifier(PortfolioLargeTitle())
                GridView(viewModel: viewModel)
                    .onAppear {
                        Task { await viewModel.fetchProjects() }
                    }
                    .sheet(item: $viewModel.selectedProject) { project in
                        ProjectSheetView(project: project)
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
                            .border(.green)
                    }
            }
            .padding(.horizontal, 12)
        }
    }
}

#Preview {
    ContentView()
}
