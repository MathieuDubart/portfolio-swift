//
//  FullScreenImageView.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 22/02/2025.
//

import SwiftUI

struct FullScreenImageView: View {
    let url: URL
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            GeometryReader { geo in
                Color.black
                    .ignoresSafeArea()
                
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.black)
                            .foregroundStyle(Color.white)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width, height: geo.size.height)
                            .background(Color.black)
                            .ignoresSafeArea()
                    case .failure:
                        Image(systemName: "exclamationmark.triangle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    @unknown default:
                        Color.black
                            .ignoresSafeArea()
                    }
                }
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}


#Preview {
    FullScreenImageView(url: URL(string:"test")!)
}
