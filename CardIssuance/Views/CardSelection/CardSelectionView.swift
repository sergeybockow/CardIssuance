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
        static let buttonCornerRadius: CGFloat = 12
    }
    
    // MARK: - Properties
    
    @EnvironmentObject var coordinator: CardOrderCoordinator
    @Environment(\.colorScheme) var colorScheme
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
                    
                    Button("Select card · \(card.price)") {
                        viewModel.selectCard(card)
                        coordinator.selectCard(card)
                        coordinator.selectColor(viewModel.selectedColor ?? "")
                        navigateToDelivery = true
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(colorScheme == .dark ? Color(red: 0.9, green: 0.9, blue: 0.9) : Color.black)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .cornerRadius(Constants.buttonCornerRadius)
                    .padding(.horizontal, 16)
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

