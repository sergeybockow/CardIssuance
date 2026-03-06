//
//  Color+Extensions.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 05.03.2026.
//

import SwiftUI

extension Color {
    static func fromString(_ name: String) -> Color {
        switch name.lowercased() {
        case "none": return .clear
        case "red": return .red
        case "yellow": return .yellow
        case "white": return .white
        case "blue": return .blue
        case "green": return .green
        case "black": return .black
        default: return .gray
        }
    }
}
