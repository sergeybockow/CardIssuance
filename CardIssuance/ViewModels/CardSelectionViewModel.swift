//
//  CardSelectionViewModel.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import Combine

class CardSelectionViewModel: ObservableObject {
    let cards: [Card] = Card.mockData()
    
    @Published var currentCard: Card?
    @Published var selectedCard: Card?
    
    init() {
        currentCard = cards.first
    }
    
    func selectCard(_ card: Card) {
        selectedCard = card
    }
}
