//
//  Body.swift
//  CarsWeekOne
//
//  Created by Артем Соловьев on 29.10.2021.
//

import Foundation

enum Body: String, CaseIterable {
    case unknown = "Некатегорированный"
    case sedan = "Седан"
    case suv = "Кроссовер"
    case coupe = "Купе"
    case van = "Фургон"
    case hatchback = "Хэтчбек"
    case pickup = "Пикап"
    
    static func getTypeOfBody(number:Int) -> Body{
        switch number {
        case 1:
            return .sedan
        case 2:
            return .suv
        case 3:
            return .coupe
        case 4:
            return .van
        case 5:
            return .hatchback
        case 6:
            return .pickup
        default:
            return .unknown
        }
    }
}
