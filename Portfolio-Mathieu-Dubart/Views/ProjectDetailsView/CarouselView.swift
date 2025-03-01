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
    @State private var reloadTrigger = UUID()
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(Array(imagesUrl.enumerated()), id: \.offset) { index, url in
                    Group {
                        if let url = url {
                            AsyncImage(url: url)
                            { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 170, height: 270)
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                case .success(let image):
                                    CarouselImage(image: image)
                                case .failure:
                                    VStack {
                                        Image(systemName: "exclamationmark.triangle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                        
                                        Text("Tap to reload")
                                    }
                                    .onTapGesture {
                                        reloadTrigger = UUID()
                                    }
                                    
                                @unknown default:
                                    EmptyView()
                                    //
                                }
                            }
                        } else {
                            Color.gray
                                .frame(width: 170, height: 270)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                    }
                    .tag(index)
                    .padding(.vertical, 12)
                    .id(reloadTrigger)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 330)
            
            HStack(spacing: 8) {
                ForEach(0..<imagesUrl.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.5))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    CarouselView(imagesUrl: [])
}
