//
//  DeliveryAddressView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 05.03.2026.
//

import SwiftUI

struct DeliveryAddressView: View {
    @EnvironmentObject var coordinator: CardOrderCoordinator
    
    var body: some View {
        NavigationStack {
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
                    Text(address.street)
                    Text(address.city)
                    Text(address.country)
                } else {
                    Text("No address selected")
                        .foregroundColor(.gray)
                }
                Button("Confirm address") { }
                Button("Change address") { }
            }
            .padding()
            .navigationTitle("Delivery Address")
        }
    }
}
