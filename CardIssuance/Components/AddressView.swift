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
        HStack(spacing: 12) {
            Image(systemName: "location.fill")
                .foregroundColor(.blue)
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(address.street)
                    .font(.headline)
                Text("\(address.city), \(address.country)")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(address.postCode)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal, 16)
    }
}

#Preview {
    AddressView(address: Address(
        id: "1",
        country: "Russia",
        street: "Pushkina 12",
        city: "Moscow",
        postCode: "101000"
    ))
}
