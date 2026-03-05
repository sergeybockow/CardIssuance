//
//  Card+Mock.swift.swift
//  CardIssuance
//
//  Created by Сергей Бочков on 03.03.2026.
//

extension Card {
    static func mockData() -> [Card] {
        [Card(id: "1",
              name: "Credit",
              description: "Your credit card",
              colors: ["yellow"],
              price: "5$",
              imageURL: "https://i.pinimg.com/736x/c2/fa/dd/c2faddfc8a46b6eaba0a56c28cda8bb9.jpg"),
         
         Card(id: "2",
              name: "Junior",
              description: "Card from the Junior bank",
              colors: ["red"],
              price: "free",
              imageURL: "https://avatars.mds.yandex.net/i?id=a25bdd69235ce5eb3d4c217026891822_l-12516072-images-thumbs&n=13"),
         
         Card(id: "3",
              name: "Air",
              description: "Card with flight privileges",
              colors: ["White", "Blue", "Red"],
              price: "10$",
              imageURL: "https://bankrating.ru/wp-content/uploads/2021/04/tinkoff-ALL-Airlines.png"),
        ]
    }
}
