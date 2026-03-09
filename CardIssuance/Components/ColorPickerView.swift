//
//  ColorPickerView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 06.03.2026.
//

import SwiftUI

struct ColorPickerView: View {
    
    let colors: [String]
    @Binding var selectedColor: String?
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(colors, id: \.self) { color in
                            let isSelected = selectedColor == color
                            Circle()
                                .fill(Color.fromString(color))
                                .frame(
                                    width: isSelected ? 54 : 40,
                                    height: isSelected ? 54 : 40
                                )
                                .overlay(
                                    Circle()
                                        .strokeBorder(isSelected ? Color.primary : Color.clear, lineWidth: 2)
                                )
                                .opacity(isSelected ? 1.0 : 0.5)
                                .animation(.spring(), value: isSelected)
                                .scrollTransition { content, phase in
                                    content.scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                }
                                .id(color)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedColor = color
                                        proxy.scrollTo(color, anchor: .center)
                                    }
                                }
                        }
                    }
                    .scrollTargetLayout()
                    .padding(.horizontal, geometry.size.width / 2 - 27)
                }
                .scrollTargetBehavior(.viewAligned)
                .frame(height: 70)
                .onAppear {
                    selectedColor = colors.first
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation {
                            proxy.scrollTo(colors.first, anchor: .center)
                        }
                    }
                }
            }
        }
        .frame(height: 70)
    }
}
