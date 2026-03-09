//
//  CardView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 05.03.2026.
//

import SwiftUI

struct CardView: View {
    @State private var isAnimating = false
    
    let card: Card
    let selectedColor: String?
    
    var body: some View {
        AsyncImage(url: URL(string: card.imageURL)) { phase in
            switch phase {
            case .empty:
                ShimmerView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .overlay(
                        Color.fromString(selectedColor ?? "")
                            .opacity(0.3)
                    )
            case .failure:
                Image(systemName: "creditcard")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(height: 200)
            @unknown default:
                EmptyView()
            }
        }
        .aspectRatio(1.586, contentMode: .fit)
        .cornerRadius(12)
    }
}
