//
//  CardOrderCoordinator.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import Combine
import Foundation

final class CardOrderCoordinator: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var selectedCard: Card?
    @Published private(set) var selectedColor: String?
    @Published private(set) var orderStatus: OrderStatus?
    @Published private(set) var address: Address?
    
    private let addressKey = "saved_address"
    
    init() {
        loadAddress()
    }
    
    // MARK: - Methods
    
    func selectCard(_ card: Card) {
        selectedCard = card
    }
    
    func selectColor(_ color: String) {
        selectedColor = color
    }
    
    func setAddress(_ address: Address) {
        self.address = address
        saveAddress(address)
    }
    
    func updateStatus(_ status: OrderStatus) {
        orderStatus = status
    }
    
    private func saveAddress(_ address: Address) {
        if let encoded = try? JSONEncoder().encode(address) {
            UserDefaults.standard.set(encoded, forKey: addressKey)
        }
    }
    
    private func loadAddress() {
        guard let data = UserDefaults.standard.data(forKey: addressKey),
              let address = try? JSONDecoder().decode(Address.self, from: data) else { return }
        self.address = address
    }
}

