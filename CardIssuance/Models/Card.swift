//
//  Card.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import Foundation

struct Card: Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
    let colors: [String]
    let price: String
    let imageURL: String
}

struct Address: Identifiable {
    let id: String
    let country: String
    let street: String
    let city: [String]
    let postCode: String
}

struct CardOrder {
    let card: Card
    let color: String
    let address: Address
}


