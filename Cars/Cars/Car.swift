//
//  File.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import Foundation

struct Car {
    let image, title, author: String
    let price: [Int]
    
}

extension Car {
    static var sampleData: [Self] {
        let first = Car(image: "Audi", title: "Audi", author: "Август Хорьх", price: [10000,12000,1300,1400])
        let second = Car(image: "Mersedes", title: "Mersedes", author: "Карл Бенц", price: [10000,12000,1300,1400])
        let third = Car(image: "bmw", title: "BMW", author: "Густав Отто", price: [10000,12000,1300,1400])
        let forth = Car(image: "volkswagen", title: "Volkswagen", author: "Германский трудовой фронт", price: [10000,12000,1300,1400])
        let five = Car(image: "porsche", title: "Porsche", author: "Германский трудовой фронт", price: [10000,12000,1300,1400])
        return [first, second, third, forth, five]
    }
}
