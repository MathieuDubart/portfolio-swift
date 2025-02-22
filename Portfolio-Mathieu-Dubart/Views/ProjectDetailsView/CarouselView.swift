//
//  CarouselView.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 22/02/2025.
//

import SwiftUI

struct CarouselView: View {
    var imagesUrl: [URL?]
    @State private var currentIndex = 0
    @State private var selectedImageURL: URL? = nil
    @State private var isFullScreenPresented = false
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(Array(imagesUrl.enumerated()), id: \.offset) { index, url in
                    Group {
                        if let url = url {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 170, height: 270)
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 170, height: 270)
                                        .clipped()
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                        .onTapGesture {
                                            selectedImageURL = url
                                            isFullScreenPresented = true
                                        }
                                case .failure:
                                    Image(systemName: "exclamationmark.triangle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        } else {
                            Color.gray
                                .frame(width: 170, height: 270)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                    }
                    .tag(index)
                    .padding(.vertical, 20)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 300)
            .padding(.horizontal, 50)
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % imagesUrl.count
                }
            }
            
            HStack(spacing: 8) {
                ForEach(0..<imagesUrl.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.5))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 10)
        }
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            if let url = selectedImageURL {
                FullScreenImageView(url: url)
            }
        }
    }
}

#Preview {
    CarouselView(imagesUrl: [])
}
