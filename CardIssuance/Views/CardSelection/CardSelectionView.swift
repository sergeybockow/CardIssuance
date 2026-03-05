//
//  CardSelectionView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import SwiftUI

struct CardSelectionView: View {
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = CardSelectionViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $viewModel.currentCard) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .tag(card)
                    }
                }
                
                .tabViewStyle(.page)
                .frame(height: 200)
                
                if let card = viewModel.currentCard {
                    Text(card.name)
                        .font(.title)
                    Text(card.description)
                        .font(.caption)
                    
                    Button("Select card · \(card.price)") {
                        viewModel.selectCard(card)
                        coordinator.selectedCard = card
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(colorScheme == .dark ? Color(red: 0.9, green: 0.9, blue: 0.9) : Color.black)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .cornerRadius(12)
                    .padding(.horizontal, 16)
                    
                }
                
                //Text("Select your card")
            }
            .padding(.horizontal)
            .navigationTitle("Card Selection")
        }
    }
}

