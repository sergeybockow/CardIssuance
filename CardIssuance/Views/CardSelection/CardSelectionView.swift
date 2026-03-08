//
//  CardSelectionView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import SwiftUI

struct CardSelectionView: View {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cardHeight: CGFloat = 200
        static let colorCircleSize: CGFloat = 50
    }
    
    // MARK: - Properties
    
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @StateObject private var viewModel = CardSelectionViewModel()
    @State private var navigateToDelivery = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $viewModel.currentCard) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, selectedColor: card == viewModel.currentCard ? viewModel.selectedColor : nil)
                            .tag(card)
                    }
                }
                .tabViewStyle(.page)
                .frame(height: Constants.cardHeight)
                
                if let card = viewModel.currentCard {
                    Text(card.name)
                        .font(.title)
                    Text(card.description)
                        .font(.caption)
                    
                    ColorPickerView(colors: card.colors, selectedColor: $viewModel.selectedColor)
                    
                    PrimaryButton(title: "Select card · \(card.price)", style: .primary) {
                        viewModel.selectCard(card)
                        coordinator.selectCard(card)
                        coordinator.selectColor(viewModel.selectedColor ?? "")
                        navigateToDelivery = true
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Card Selection")
            .navigationDestination(isPresented: $navigateToDelivery) {
                DeliveryAddressView()
            }
        }
    }
}

#Preview {
    CardSelectionView()
        .environmentObject(CardOrderCoordinator())
}

