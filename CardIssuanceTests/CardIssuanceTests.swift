//
//  CardIssuanceTests.swift
//  CardIssuanceTests
//
//  Created by Сергей Бочков on 03.03.2026.
//

import XCTest
@testable import CardIssuance

final class CardIssuanceTests: XCTestCase {

    // Тест: форма невалидна когда все поля пустые
    func testFormIsInvalidWhenEmpty() {
        let isValid = validateForm(country: "", city: "", street: "", postcode: "", phone: "")
        XCTAssertFalse(isValid)
    }

    // Тест: форма невалидна если телефон короче 11 цифр
    func testFormIsInvalidWithShortPhone() {
        let isValid = validateForm(country: "Russia", city: "Moscow", street: "Pushkina 12", postcode: "101000", phone: "123")
        XCTAssertFalse(isValid)
    }

    // Тест: форма валидна когда все поля заполнены корректно
    func testFormIsValidWhenAllFieldsFilled() {
        let isValid = validateForm(country: "Russia", city: "Moscow", street: "Pushkina 12", postcode: "101000", phone: "79991234567")
        XCTAssertTrue(isValid)
    }
    
    // Тест: моковые данные не пустые
    func testMockDataNotEmpty() {
        XCTAssertFalse(Card.mockData().isEmpty)
    }
    
    // Тест: адрес создаётся с правильными данными
    func testAddressCreation() {
        let address = Address(id: "1", country: "Russia", street: "Pushkina", city: "Moscow", postCode: "101000")
        XCTAssertEqual(address.city, "Moscow")
        XCTAssertEqual(address.country, "Russia")
    }

    // MARK: - Private
    
    private func validateForm(country: String, city: String, street: String, postcode: String, phone: String) -> Bool {
        !country.isEmpty &&
        !city.isEmpty &&
        !street.isEmpty &&
        !postcode.isEmpty &&
        phone.filter { $0.isNumber }.count == 11
    }
}
