//
//  FormTextField.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//
import SwiftUI

struct FormTextField: View {
    
    // MARK: - Properties
    
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var isValid: Bool = true
    
    // MARK: - Private
    
    private var borderColor: Color {
        if !isValid { return .red }
        if !text.isEmpty { return .blue }
        return .clear
    }
    
    // MARK: - Body
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.15))
            .cornerRadius(8)
            .keyboardType(keyboardType)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 1.5)
            )
    }
}
