//
//  ProjectSheetView.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct ProjectSheetView: View {
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(project.title.uppercased())
                .modifier(PortfolioTitle())
                
            
            Text(project.date)
                .foregroundColor(.secondary)
                .modifier(PortfolioDateCaption())
            
            Spacer()
                .frame(height: 20)

            Text(project.description)
                        
            Spacer()
                .frame(height: 20)

            Button {} label: {
                HStack {
                    Text("View project")
                    Image(systemName: "arrow.right")
                }
            }
        }
    }
}

#Preview {
    ProjectSheetView(project: Project.example)
}
