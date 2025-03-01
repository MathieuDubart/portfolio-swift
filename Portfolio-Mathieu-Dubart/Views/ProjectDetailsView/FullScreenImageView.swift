//
//  FullScreenImageView.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 22/02/2025.
//

import SwiftUI

struct FullScreenImageView: View {
    let image: Image
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Color.black.ignoresSafeArea()
                
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
        
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    FullScreenImageView(image: Image(systemName: "pencil"))
}
