//
//  AboutMeView.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 22/02/2025.
//

import SwiftUI

struct AboutMeView: View {
    @StateObject private var viewModel = AboutMeViewModel()
    @Environment(\.openURL) var openURL

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("About Me")
                    .modifier(PortfolioLargeTitle())
                Spacer().frame(height: 20)

                Text(viewModel.role)
                    .modifier(PortfolioDateCaption())
                Spacer().frame(height: 20)

                Text(viewModel.introduction)
                Spacer().frame(height: 40)

                Button {
                    if let url = URL(string: "mailto:hello@mathieu-dubart.fr") {
                        openURL(url)
                    }
                } label: {
                    HStack {
                        Image(systemName: "envelope.fill")
                        Text("Want to work together?")
                    }
                }
                .buttonStyle(PortfolioButton())
            }

            Spacer().frame(height: 40)

            Text("You can find me here")
                .modifier(PortfolioTitle())

            HStack {
                Button {
                    if let url = URL(string: viewModel.githubUrl) {
                        openURL(url)
                    }
                } label: {
                    HStack {
                        Text("GitHub")
                        Image(systemName: "arrow.right")

                    }
                }
                .buttonStyle(PortfolioButton())

                Button {
                    if let url = URL(string: viewModel.linkedinUrl) {
                        openURL(url)
                    }
                } label: {
                    HStack {
                        Text("LinkedIn")
                        Image(systemName: "arrow.right")

                    }
                }
                .buttonStyle(PortfolioButton())
            }

            Button {
                if let url = URL(string: viewModel.instagramUrl) {
                    openURL(url)
                }
            } label: {
                HStack {
                    Text("Instagram")
                    Image(systemName: "arrow.right")

                }
            }
            .buttonStyle(PortfolioButton())

        }
        .padding(12)
    }
}

#Preview {
    AboutMeView()
}
