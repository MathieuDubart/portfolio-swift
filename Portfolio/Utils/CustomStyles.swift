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
            .background(Color.white)
            .font(.headline)
            .cornerRadius(12)
            .shadow(color: Color(red: 0.35, green: 0.03, blue: 0.12), radius: 0, x: 0, y: configuration.isPressed ? 0 : 5)
            .offset(y: configuration.isPressed ? 5 : 0)
            .animation(.spring(response: 0, dampingFraction: 0.5, blendDuration: 0.1), value: configuration.isPressed)
    }
}
