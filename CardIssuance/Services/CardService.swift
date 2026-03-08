//
//  CardService.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//

import Foundation

final class CardService {
    
    //MARK: - Methods
    
    func fetchCards() -> [Card] {
        Card.mockData()
    }
}
