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
                .environmentObject(coordinator)
        }
    }
    
    init() {
        URLCache.shared.memoryCapacity = 50 * 1024 * 1024
        URLCache.shared.diskCapacity = 100 * 1024 * 1024
    }
}
