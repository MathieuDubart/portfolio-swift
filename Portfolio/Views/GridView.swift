//
//  GridView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct GridView: View {
    private let columns = [GridItem(.adaptive(minimum: 150))]
    @State var viewModel: ProjectsListViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.projects) { project in
                    ProjectCard(project: project)
                        .onTapGesture { _ in
                            viewModel.selectedProject = project
                        }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    GridView(viewModel: ProjectsListViewModel())
}
