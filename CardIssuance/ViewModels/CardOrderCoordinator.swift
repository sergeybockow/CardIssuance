//
//  CardOrderCoordinator.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import Combine

final class CardOrderCoordinator: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var selectedCard: Card?
    @Published private(set) var selectedColor: String?
    @Published private(set) var address: Address?
    @Published private(set) var orderStatus: OrderStatus?
    
    // MARK: - Methods

    func selectCard(_ card: Card) {
        selectedCard = card
    }

    func selectColor(_ color: String) {
        selectedColor = color
    }

    func setAddress(_ address: Address) {
        self.address = address
    }
}

