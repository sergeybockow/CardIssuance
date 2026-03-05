//
//  CardIssuanceApp.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

import SwiftUI

@main
struct CardIssuanceApp: App {
    @StateObject var coordinator = CardOrderCoordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
