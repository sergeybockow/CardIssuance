//
//  DeliveryAddressView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 05.03.2026.
//

import SwiftUI

struct DeliveryAddressView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @State private var navigateToConfirmation = false
    @State private var navigateToAddressForm = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // заглушка карты
            AsyncImage(url: URL(string: "https://avatars.mds.yandex.net/i?id=685588ba7b8751f79a13fc641cb8edee_l-10496575-images-thumbs&n=13")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(12)
                        .clipped()
                default:
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                        .overlay(
                            Image(systemName: "map")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        )
                }
            }
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

// MARK: - Preview

#Preview {
    DeliveryAddressView()
        .environmentObject(CardOrderCoordinator())
}
