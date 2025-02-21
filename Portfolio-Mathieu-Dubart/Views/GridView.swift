//
//  GridView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct GridView: View {
    private let columns = [GridItem(.adaptive(minimum: 140))]
    @EnvironmentObject var viewModel: ProjectsListViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.projects) { project in
                    ProjectCard(project: project)
                }
            }
        }
    }
}

#Preview {
    GridView()
}
