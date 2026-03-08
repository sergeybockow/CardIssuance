//
//  AddressFormView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//

import SwiftUI

struct AddressFormView: View {
    @StateObject private var viewModel = AddressFormViewModel()
    
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            FormTextField(placeholder: "Country", text: $viewModel.country)
            FormTextField(placeholder: "City", text: $viewModel.city)
            FormTextField(placeholder: "Street", text: $viewModel.street)
            FormTextField(placeholder: "Postcode", text: $viewModel.postcode, keyboardType: .numberPad)
            FormTextField(placeholder: "+7 (___) ___-__-__", text: $viewModel.phone, keyboardType: .phonePad, isValid: viewModel.isPhoneValid)
            
            PrimaryButton(title: "Save address", style: .primary) {
                coordinator.setAddress(viewModel.saveAddress())
                dismiss()
            }
            .disabled(!viewModel.isFormValid)
            .opacity(viewModel.isFormValid ? 1.0 : 0.5)
        }
        .listStyle(.insetGrouped)
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("New address")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                .foregroundColor(.blue)
            }
        }
    }
}
