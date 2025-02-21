//
//  StylesExtensions.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import SwiftUI

struct PortfolioLargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Baskerville-SemiBold", size: 86))
    }
}

struct PortfolioTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Baskerville-SemiBold", size: 64))
    }
}

struct PortfolioDateCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Baskerville-SemiBold", size: 32))
            .foregroundStyle(Color.secondary)
    }
}

struct PortfolioButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .frame(minWidth: 80, minHeight: 25)
            .background(Color.secondary)
            .font(.headline)
            .foregroundStyle(Color.white)
            .cornerRadius(12)
    }
}
