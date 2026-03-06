//
//  CardSelectionViewModel.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import Combine

final class CardSelectionViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let cards: [Card] = Card.mockData()
    
    @Published var currentCard: Card? {
        didSet {
            selectedColor = currentCard?.colors.first
        }
    }
    @Published private(set) var selectedCard: Card?
    @Published var selectedColor: String?
        
    init() {
        currentCard = cards.first
    }
    
    // MARK: - Methods
    
    func selectCard(_ card: Card) {
        selectedCard = card
    }
}
