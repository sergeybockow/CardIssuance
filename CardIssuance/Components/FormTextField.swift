//
//  FormTextField.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//
import SwiftUI

struct FormTextField: View {
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.15))
            .cornerRadius(8)
            .keyboardType(keyboardType)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}
