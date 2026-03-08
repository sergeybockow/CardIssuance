//
//  PrimaryButton.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//

import SwiftUI

struct PrimaryButton: View {
    
    // MARK: - Properties
    
    let title: String
    let style: ButtonStyle
    let action: () -> Void
    
    @State private var isPressed = false
    @Environment(\.colorScheme) var colorScheme
    
    var backgroundColor: Color {
        switch style {
        case .primary:
            return .blue
        case .secondary:
            return colorScheme == .dark ? Color(red: 0.9, green: 0.9, blue: 0.9) : Color.black
        }
    }
    
    var foregroundColor: Color {
        switch style {
        case .primary:
            return .white
        case .secondary:
            return colorScheme == .dark ? .black : .white
        }
    }
    
    enum ButtonStyle {
        case primary
        case secondary
    }
    
    // MARK: - Body
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(12)
            .contentShape(Rectangle())
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .animation(.spring(duration: 0.2), value: isPressed)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in isPressed = true }
                    .onEnded { _ in
                        isPressed = false
                        action()
                    }
            )
            .padding(.horizontal, 16)
    }

}
