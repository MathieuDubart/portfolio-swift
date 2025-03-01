//
//  CarouselImage.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 01/03/2025.
//

import SwiftUI

struct CarouselImage: View {
    var image: Image
    @State private var opacity = 0.7
    @State private var isFullScreenPresented = false
    
    var body: some View {
        ZStack {
            image
                .resizable()
                .scaledToFit()
                .frame(minWidth:200, maxHeight: 330)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.horizontal, 6)

            Image(systemName: "hand.tap")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .padding(12)
                .background(.black)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .opacity(opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
                        withAnimation {
                            self.opacity = 0
                        }
                    }
                }
        }
        .onTapGesture {
            isFullScreenPresented = true
        }
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            FullScreenImageView(image: image)
        }
    }
}

#Preview {
    CarouselImage(image: Image(systemName: "pencil"))
}
