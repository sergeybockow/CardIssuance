//
//  DeliveryAddressView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 05.03.2026.
//

import SwiftUI

struct DeliveryAddressView: View {
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @State private var navigateToConfirmation = false
    @State private var navigateToAddressForm = false
    
    var body: some View {
        VStack {
            // заглушка карты
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 200)
                .overlay(
                    Image(systemName: "map")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                )
            if let address = coordinator.address {
                AddressView(address: address)
            } else {
                Text("No address selected")
                    .foregroundColor(.gray)
            }
            PrimaryButton(title: "Confirm address", style: .primary) {
                navigateToConfirmation = true
            }
            
            PrimaryButton(title: "Change address", style: .secondary) {
                navigateToAddressForm = true
            }
        }
        .padding()
        .navigationTitle("Delivery Address")
        .navigationDestination(isPresented: $navigateToConfirmation) {
            ConfirmationView()
        }
        .navigationDestination(isPresented: $navigateToAddressForm) {
            AddressFormView()
        }
    }
}
