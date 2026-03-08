//
//  ConfirmationView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//

import SwiftUI

struct ConfirmationView: View {
    
    // MARK: - Properties
    
    @State private var showSuccess = false
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            if let card = coordinator.selectedCard {
                CardView(card: card, selectedColor: coordinator.selectedColor)
            }
            
            if let address = coordinator.address {
                AddressView(address: address)
            }
            
            PrimaryButton(title: "Place order", style: .primary) {
                showSuccess = true
            }
            
            PrimaryButton(title: "Back", style: .secondary) {
                dismiss()
            }
        }
        .navigationTitle("Confirmation order")
        .sheet(isPresented: $showSuccess) {
            VStack(spacing: 16) {
                Text("🎉")
                    .font(.largeTitle)
                Text("Order placed!")
                    .font(.title)
                    .bold()
                Text("We have already started making your card, it will be delivered to you soon.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
            }
            .padding(32)
            .presentationDetents([.fraction(0.3)])
        }
    }
}

// MARK: - Preview

#Preview {
    ConfirmationView()
        .environmentObject(CardOrderCoordinator())
}
