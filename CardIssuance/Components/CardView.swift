//
//  CardView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 05.03.2026.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        AsyncImage(url: URL(string: card.imageURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(height: 200)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
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
    }
}
