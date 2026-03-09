//
//  AddressFormViewModel.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 08.03.2026.
//

import Foundation
import Combine

final class AddressFormViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var country = "Russia"
    @Published var city = "Moscow"
    @Published var street = ""
    @Published var postcode = ""
    @Published var phone = ""
    
    // MARK: - Validation
    
    var isPhoneValid: Bool {
        phone.isEmpty || phone.filter { $0.isNumber }.count == 11
    }
    
    var isFormValid: Bool {
        !country.isEmpty &&
        !city.isEmpty &&
        !street.isEmpty &&
        !postcode.isEmpty &&
        phone.filter { $0.isNumber }.count == 11
    }
    
    // MARK: - Methods
    
    func saveAddress() -> Address {
        Address(
            id: UUID().uuidString,
            country: country,
            street: street,
            city: city,
            postCode: postcode
        )
    }
}
