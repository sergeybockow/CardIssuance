//
//  AddressView.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//

import SwiftUI

struct AddressView: View {
    let address: Address
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(address.street)
            Text(address.city)
            Text(address.country)
        }
    }
}
