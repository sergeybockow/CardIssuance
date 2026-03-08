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
    @State private var showAddressError = false
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Group {
                if let card = coordinator.selectedCard {
                    CardView(card: card, selectedColor: coordinator.selectedColor)
                }
                
                if let address = coordinator.address {
                    AddressView(address: address)
                }
                
                switch coordinator.orderStatus {
                case .none:
                    PrimaryButton(title: "Place order", style: .primary) {
                        if coordinator.address == nil {
                            showAddressError = true
                        } else {
                            coordinator.updateStatus(.issued)
                            showSuccess = true
                        }
                    }
                    
                    if showAddressError {
                        Text("Please add delivery address first")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                case .issued:
                    Text("Order placed ✓")
                        .foregroundColor(.blue)
                    PrimaryButton(title: "Cancel order", style: .secondary) {
                        coordinator.updateStatus(.cancelled)
                    }
                case .cancelled:
                    Text("Order cancelled ✗")
                        .foregroundColor(.red)
                case .inDelivery:
                    Text("In delivery 🚚")
                        .foregroundColor(.orange)
                case .delivered:
                    Text("Delivered ✓")
                        .foregroundColor(.green)
                }
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
