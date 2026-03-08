//
//  AddressFormView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//

import SwiftUI

struct AddressFormView: View {
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @Environment(\.dismiss) var dismiss
    
    @State private var navigateToDelivery = false
    @State private var country = ""
    @State private var city = ""
    @State private var street = ""
    @State private var postcode = ""
    @State private var phone = ""
    
    var body: some View {
        List {
            FormTextField(placeholder: "Country", text: $country)
            FormTextField(placeholder: "City", text: $city)
            FormTextField(placeholder: "Street", text: $street)
            FormTextField(placeholder: "Postcode", text: $postcode, keyboardType: .numberPad)
            FormTextField(placeholder: "+7 (___) ___-__-__", text: $phone, keyboardType: .phonePad)
            
            PrimaryButton(title: "Save address", style: .primary) {
                let newAddress = Address(
                    id: UUID().uuidString,
                    country: country,
                    street: street,
                    city: city,
                    postCode: postcode
                )
                coordinator.setAddress(newAddress)
                dismiss()
            }
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
