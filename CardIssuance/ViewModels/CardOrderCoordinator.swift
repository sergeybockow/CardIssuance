//
//  CardOrderCoordinator.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import Combine

class CardOrderCoordinator: ObservableObject {
    @Published var selectedCard: Card?
    @Published var selectedColor: String?
    @Published var address: Address?
    @Published var orderStatus: OrderStatus?
}
