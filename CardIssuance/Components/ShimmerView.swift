//
//  ShimmerView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 05.03.2026.
//

import SwiftUI

struct ShimmerView: View {
    @State private var phase: CGFloat = 0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.gray.opacity(0.3))
            .overlay(
                GeometryReader { geo in
                    LinearGradient(
                        colors: [
                            .clear,
                            .white.opacity(0.25),
                            .clear
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: geo.size.width * 0.7)
                    .offset(x: phase * geo.size.width * 1.4 - geo.size.width * 0.4)
                }
            )
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
            .clipped()
    }
}
